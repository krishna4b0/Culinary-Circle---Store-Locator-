/*
 * Copyright 1997-2009 Day Management AG
 * Barfuesserplatz 6, 4001 Basel, Switzerland
 * All Rights Reserved.
 *
 * This software is the confidential and proprietary information of
 * Day Management AG, ("Confidential Information"). You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with Day.
 */

/**
 * @class SVU.widgets.QuickListProduct
 * @extends CQ.form.Slideshow
 * <p>The Slideshow provides a component that can be used to define and edit a set of images
 * and image titles that may be viewed as a slideshow.</p>
 * <p>The Slideshow component is based upon the {@link CQ.form.SmartImage} component, but
 * currently does only allow image references (the upload feature is disabled).</p>
 * @constructor
 * Creates a new Slideshow.
 * @param {Object} config The config object
 */
SVU.widgets.QuickListProduct = CQ.Ext.extend(CQ.form.Slideshow, {

    /**
     * @cfg {CQ.Ext.Panel} headPanel
     * The UI component that is responsible for changing the currently edited slide.
     * Defaults to a suitable implementation that should not be changed.
     */
    /**
     * @cfg {CQ.Ext.Panel} footPanel
     * The UI component that is responsible for changing the title of the currently edited
     * slide. Defaults to a suitable implementation that should not be changed.
     */
    /**
     * @cfg {Boolean} hideMainToolbar
     * <code>true</code> to hide the main toolbar (the one under the actual picture;
     * defaults to true)
     */
    /**
     * @cfg {Boolean} allowUpload
     * Flag if uploading a file is allowed (defaults to false as of CQ 5.3). You should
     * not change this setting, as currently only file references are supported by the
     * Slideshow widget. Note that this property defaulted to true for CQ 5.2 and has
     * therefore to be set to false explicitly for the widget to work properly on 5.2.
     */

    /**
     * @cfg {String} fileReferencePrefix
     * Prefix to be used to address a single slide; use the '$' placeholder to integrate the
     * internal slide number (defaults to "./image$")
     */
    fileReferencePrefix: null,

    /**
     * Head panel with slideshow specific functionality
     * @type CQ.form.Slideshow.SlidesPanel
     * @private
     */
    headPanel: null,

    /**
     * Array that contains all currently defined slides
     * @type CQ.form.Slideshow.Slide[]
     * @private
     */
    slides: null,

    /**
     * The currently edited slide
     * @type CQ.form.Slideshow.Slide
     * @private
     */
    editedSlide: null,

    /**
     * Panel to preselect. This is part of a workaround for an Ext bug regarding IE.
     * @type CQ.Ext.Container
     * @private
     */
    activeTabToPreselect: null,

    /**
     * Name field. See bug# 25253.
     * @private
     */
    name: "",

    constructor: function(config) {

        config = config || { };
        var defaults = {
            "headPanel": new CQ.form.Slideshow.SlidesPanel({
                "onSlideChanged": this.onSlideChanged.createDelegate(this),
                "onAddButton": this.onAddButton.createDelegate(this),
                "onRemoveButton": this.onRemoveButton.createDelegate(this)
            }),
            "footPanel": new SVU.widgets.QuickListProduct.TitlePanel({ }),
            "fileReferencePrefix": "./image$",
            "hideMainToolbar": true,
            "allowReference": true,
            "allowUpload": false
        };

        CQ.Util.applyDefaults(config, defaults);
        SVU.widgets.QuickListProduct.superclass.constructor.call(this, config);

        this.slides = [ ];
    },

    /**
     * Initializes the component.
     * @private
     */
    initComponent: function() {
        SVU.widgets.QuickListProduct.superclass.initComponent.call(this);
    },


    // Model -------------------------------------------------------------------------------

    /**
     * Creates a new slide. The view is not updated.
     * @private
     * @return {CQ.form.Slideshow.Slide The slide
     */
    createSlide: function(data, slideIndex, basePath) {
        // todo parameter names should not be hardcoded (but the SWF currently requires it)
        var title = (data ? data["jcr:title"] : null);
        var price = (data ? data["price"] : null);
        var description = (data ? data["description"] : null);
        var fileRef = (data ? data["fileReference"] : null);
        var slide;
        if (data && fileRef) {
            // add existing slide
            var referencedFileInfo = this.resolveReference(fileRef, basePath);
            if (referencedFileInfo) {
                slide = new SVU.widgets.QuickListProduct.Slide({
                    "referencedFileInfo": referencedFileInfo,
                    "title": title,
                    "price": price,
                    "description": description,
                    "slideIndex": slideIndex,
                    "isPersistent": true,
                    "isDeleted": false
                });
            }
        } else {
            // create new slide
            slide = new SVU.widgets.QuickListProduct.Slide({
                "referencedFileInfo": null,
                "title": null,
                "price": null,
                "description": null,
                "slideIndex": slideIndex,
                "isPersistent": false,
                "isDeleted": false
            });
        }
        this.slides.push(slide);
        return slide;
    },
    
    /**
     * Inits processing the record
     * @param {String} price The content price of the slideshow instance being edited
     * @private
     */
    // todo: remove if definitely not needed; otherwise try to move to initComponent or render listener
//    processPrice: function(price) {
//        this.dataPath = price;
//        this.slides.length = 0;
//        this.headPanel.enableFormElements();
//        this.footPanel.enableFormElements();
//        CQ.form.Slideshow.superclass.processPath.call(this, price);
//
//        // create default slide
//        this.slides.length = 0;
//        this.addNewSlide();
//        this.showSlide(this.editedSlide);
//
//        this.buildComboBoxContent();
//    },

    /**
     * Sets the value of the field using the given record. If no according value
     * exists the default value is set. This method is usually called by
     * {@link CQ.Dialog#processRecords}.
     * @param {CQ.Ext.data.Record} record The record
     * @param {String} price The content price the record was created from (used for resolving
     *        relative file prices)
     */
    processRecord: function(record, price) {
        if (this.fireEvent('beforeloadcontent', this, record, price) !== false) {
            this.dataPath = price;
            this.slides.length = 0;
            this.headPanel.enableFormElements();
            this.footPanel.enableFormElements();

            // initialize only, as record processing for this dynamic widget is handled
            // completely different
            CQ.form.Slideshow.superclass.processPath.call(this, price);

            // parse all slides from record
            // todo use a better implementation after slideshow.swf has been updated
            var prefix = this.fileReferencePrefix.replace("./", "");
            var placeholderPos = prefix.indexOf("$");
            var prefixLen = prefix.length;
            var part1 = prefix;
            var part2 = null;
            var hasPlaceholder = (placeholderPos >= 0);
            if (placeholderPos == 0) {
                part1 = null;
                part2 = prefix.substring(1, prefixLen);
            } else if (placeholderPos > 0) {
                if (placeholderPos < (prefixLen - 1)) {
                    part1 = prefix.substring(0, placeholderPos);
                    part2 = prefix.substring(placeholderPos + 1, prefixLen);
                } else {
                    part1 = prefix.substring(0, placeholderPos);
                    part2 = null;
                }
            }

            var data = record.data;
            for (var key in data) {
                if (hasPlaceholder) {
                    var isMatching = true;
                    var indexPos;
                    var part2Pos = key.length;
                    if (part1 != null) {
                        if (key.indexOf(part1) == 0) {
                            indexPos = part1.length;
                        } else {
                            isMatching = false;
                        }
                    }
                    if ((part2 != null) && isMatching) {
                        part2Pos = key.indexOf(part2, indexPos);
                        if (part2Pos > indexPos) {
                            if ((part2Pos + part2.length) < key.length) {
                                isMatching = false;
                            }
                        } else {
                            isMatching = false;
                        }
                    }
                    if (isMatching) {
                        this.createSlide(
                                record.get(key), key.substring(indexPos, part2Pos), price);
                    }
                } else if (key == part1) {
                    this.createSlide(record.get(key), 1, price);
                }
            }

            // select slide to edit
            this.editedSlide = this.getFirstSlide();
            if (!this.editedSlide) {
                this.addNewSlide();
            }
            this.showSlide(this.editedSlide);

            // initialize combobox
            this.buildComboBoxContent();

            this.fireEvent('loadcontent', this, record, price);
        }
    },

    /**
     * Saves changes made in the UI to the underlying data model.
     * @private
     */
    saveChanges: function() {
        if (this.editedSlide) {
            var title = this.footPanel.getTitle();
            var price = this.footPanel.getPrice();
            var description = this.footPanel.getDescription();
            this.editedSlide.referencedFileInfo = this.referencedFileInfo;
            this.editedSlide.title = (title ? title : null);
            this.editedSlide.price = (price ? price : null);
            this.editedSlide.description = (description ? description : null);
            this.headPanel.updateSlide(this.editedSlide);
        }
    },


    // View --------------------------------------------------------------------------------

    /**
     * Shows the specified slide.
     * @param {CQ.form.Slideshow.Slide} slide The slide to be shown
     * @private
     */
    showSlide: function(slide) {
        this.referencedFileInfo = slide.referencedFileInfo;
        this.footPanel.setTitle(slide.title);
        this.footPanel.setPrice(slide.price);
        this.footPanel.setDescription(slide.description);
        if (this.referencedFileInfo) {
            this.originalRefImage = new CQ.form.SmartImage.Image(this.referencedFileInfo);
            this.originalRefImage.loadHandler = function() {
                this.hideTools();
                var toolCnt = this.imageToolDefs.length;
                for (var toolIndex = 0; toolIndex < toolCnt; toolIndex++) {
                    this.imageToolDefs[toolIndex].onImageUploaded(this.originalRefImage);
                }
                this.updateView();
            }.createDelegate(this);
            this.originalRefImage.load();
        } else {
            this.originalRefImage = null;
            this.updateView();
        }
    }


});

// register xtype
CQ.Ext.reg('quicklistproduct', SVU.widgets.QuickListProduct);