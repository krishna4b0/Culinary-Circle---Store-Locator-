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
 * @class SVU.widgets.QuickListProduct.TitlePanel
 * @extends CQ.form.Slideshow.TitlePanel
 * @private
 * The TitlePanel provides the UI to edit the title of each slide.
 * @constructor
 * Creates a new TitlePanel.
 * @param {Object} config The config object
 */
SVU.widgets.QuickListProduct.TitlePanel = CQ.Ext.extend(CQ.form.Slideshow.TitlePanel, {

    constructor: function(config) {

        config = config || { };
        var defaults = {
            "layout": "table",
            "layoutConfig": {
                "columns": 2
            },
            "defaults": {
                "style": "padding: 3px;"
            },
            "minSize": 120,
            "maxSize": 120,
            "height": 120,
            "items": [{
                    "itemId": "titleLabel",
                    "xtype": "label",
                    "text": CQ.I18n.getMessage("Title")
                }, {
                    "itemId": "titlePanel",
                    "xtype": "panel",
                    "layout": "fit",
                    "border": false,
                    "hideBorders": true,
                    "items": [{
                            "itemId": "title",
                            "xtype": "textfield"
                            }]
                },
                {
                    "itemId": "priceLabel",
                    "xtype": "label",
                    "text": CQ.I18n.getMessage("Price")
                }, 
                {
                    "itemId": "pricePanel",
                    "xtype": "panel",
                    "layout": "fit",
                    "border": false,
                    "hideBorders": true,
                    "items": [{
                            "itemId": "price",
                            "xtype": "textfield"
                            }]
                },{
                    "itemId": "descriptionLabel",
                    "xtype": "label",
                    "text": CQ.I18n.getMessage("Description")
                }, {
                    "itemId": "descriptionPanel",
                    "xtype": "panel",
                    "layout": "fit",
                    "border": false,
                    "hideBorders": true,
                    "items": [{
                            "itemId": "description",
                            "xtype": "textfield"
                            }]
                }
            ],
            "listeners": {
                "bodyresize": {
                    "fn": function(comp, w, h) {
                        this.adjustTitleWidth(w);
                    },
                    "scope": this
                }
            }
        };

        CQ.Util.applyDefaults(config, defaults);
        SVU.widgets.QuickListProduct.TitlePanel.superclass.constructor.call(this, config);

    },

    initComponent: function() {
        CQ.form.Slideshow.SlidesPanel.superclass.initComponent.call(this);
    },

    afterRender: function() {
        SVU.widgets.QuickListProduct.TitlePanel.superclass.afterRender.call(this);
        this.el.setVisibilityMode(CQ.Ext.Element.DISPLAY);
        this.body.setVisibilityMode(CQ.Ext.Element.DISPLAY);
    },

    adjustTitleWidth: function(width) {
        if (width) {
            var titlePanel = this.items.get("titlePanel");
            var titleLabel = this.items.get("titleLabel");
            
            if (titleLabel.rendered) {
                var titleWidth = width - titleLabel.getEl().getWidth();
                titlePanel.setSize(titleWidth, 30);
            } else {
                this._width = width;
            }
            
            var pricePanel = this.items.get("pricePanel");
            var priceLabel = this.items.get("priceLabel");
            
            if (priceLabel.rendered) {
                var titleWidth = width - priceLabel.getEl().getWidth();
                pricePanel.setSize(titleWidth, 30);
            } else {
                this._width = width;
            }
            
            var descriptionPanel = this.items.get("descriptionPanel");
            var descriptionLabel = this.items.get("descriptionLabel");
            
            if (descriptionLabel.rendered) {
                var descriptionWidth = width - descriptionLabel.getEl().getWidth();
                descriptionPanel.setSize(descriptionWidth, 30);
            } else {
                this._width = width;
            }
            
        }
    },
    
    setPrice: function(price) {
        var pricePanel = this.items.get("pricePanel");
        var priceField = pricePanel.items.get("price");
        priceField.setValue(price ? price : "");
    },

    getPrice: function() {
        var pricePanel = this.items.get("pricePanel");
        var priceField = pricePanel.items.get("price");
        return priceField.getValue();
    },
    
    setDescription: function(description) {
        var descriptionPanel = this.items.get("descriptionPanel");
        var descriptionField = descriptionPanel.items.get("description");
        descriptionField.setValue(description ? description : "");
    },

    getDescription: function() {
        var descriptionPanel = this.items.get("descriptionPanel");
        var descriptionField = descriptionPanel.items.get("description");
        return descriptionField.getValue();
    },

    disableFormElements: function() {
        var titlePanel = this.items.get("titlePanel");
        var titleField = titlePanel.items.get("title");
        titleField.disable();
        
        var pricePanel = this.items.get("pricePanel");
        var priceField = pricePanel.items.get("price");
        priceField.disable();
        
        var descriptionPanel = this.items.get("descriptionPanel");
        var descriptionField = descriptionPanel.items.get("description");
        descriptionField.disable();
    },

    enableFormElements: function() {
        var titlePanel = this.items.get("titlePanel");
        var titleField = titlePanel.items.get("title");
        titleField.enable();
        
        var pricePanel = this.items.get("pricePanel");
        var priceField = pricePanel.items.get("price");
        priceField.enable();
        
        var descriptionPanel = this.items.get("descriptionPanel");
        var descriptionField = descriptionPanel.items.get("description");
        descriptionField.enable();
    }

});