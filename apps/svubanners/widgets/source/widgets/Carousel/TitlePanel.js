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
 * @class SVU.widgets.Carousel.TitlePanel
 * @extends CQ.form.Slideshow.TitlePanel
 * @private
 * The TitlePanel provides the UI to edit the title of each slide.
 * @constructor
 * Creates a new TitlePanel.
 * @param {Object} config The config object
 */
SVU.widgets.Carousel.TitlePanel = CQ.Ext.extend(CQ.form.Slideshow.TitlePanel, {

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
                    "itemId": "pathLabel",
                    "xtype": "label",
                    "text": CQ.I18n.getMessage("Path")
                }, 
                {
                    "itemId": "pathPanel",
                    "xtype": "panel",
                    "layout": "fit",
                    "border": false,
                    "hideBorders": true,
                    "items": [{
                            "itemId": "path",
                            "xtype": "pathfield"
                    		}]
                },{
                    "itemId": "tooltipLabel",
                    "xtype": "label",
                    "text": CQ.I18n.getMessage("Tool Tip")
                }, {
                    "itemId": "tooltipPanel",
                    "xtype": "panel",
                    "layout": "fit",
                    "border": false,
                    "hideBorders": true,
                    "items": [{
                            "itemId": "tooltip",
                            "xtype": "textfield"
                        	}]
                },
                {
                    "itemId": "overlayLabelLabel",
                    "xtype": "label",
                    "text": CQ.I18n.getMessage("Overlay Label")
                }, 
                {
                    "itemId": "overlayLabelPanel",
                    "xtype": "panel",
                    "layout": "fit",
                    "border": false,
                    "hideBorders": true,
                    "items": [{
                            "itemId": "overlayLabel",
                            "xtype": "selection",
                            "type": "checkbox"
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
        SVU.widgets.Carousel.TitlePanel.superclass.constructor.call(this, config);

    },

    initComponent: function() {
        CQ.form.Slideshow.SlidesPanel.superclass.initComponent.call(this);
    },

    afterRender: function() {
    	SVU.widgets.Carousel.TitlePanel.superclass.afterRender.call(this);
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
            
            var pathPanel = this.items.get("pathPanel");
            var pathLabel = this.items.get("pathLabel");
            
            if (pathLabel.rendered) {
                var titleWidth = width - pathLabel.getEl().getWidth();
                pathPanel.setSize(titleWidth, 30);
            } else {
                this._width = width;
            }
            
            var overlayLabelPanel = this.items.get("overlayLabelPanel");
            var overlayLabelLabel = this.items.get("overlayLabelLabel");
            
            if (overlayLabelLabel.rendered) {
                var titleWidth = width - overlayLabelLabel.getEl().getWidth();
                overlayLabelPanel.setSize(titleWidth, 30);
            } else {
                this._width = width;
            }
            
            var tooltipPanel = this.items.get("tooltipPanel");
            var tooltipLabel = this.items.get("tooltipLabel");
            
            if (tooltipLabel.rendered) {
                var tooltipWidth = width - tooltipLabel.getEl().getWidth();
                tooltipPanel.setSize(tooltipWidth, 30);
            } else {
                this._width = width;
            }
            
        }
    },
    
    setOverlayLabel: function(overlayLabel) {
    	var overlayLabelPanel = this.items.get("overlayLabelPanel");
        var overlayLabelField = overlayLabelPanel.items.get("overlayLabel");
        overlayLabelField.setValue(overlayLabel ? overlayLabel : "false");
    },
    
    getOverlayLabel: function() {
    	var overlayLabelPanel = this.items.get("overlayLabelPanel");
        var overlayLabelField = overlayLabelPanel.items.get("overlayLabel");
        return overlayLabelField.getValue();
    },

    setPath: function(path) {
        var pathPanel = this.items.get("pathPanel");
        var pathField = pathPanel.items.get("path");
        pathField.setValue(path ? path : "");
    },

    getPath: function() {
        var pathPanel = this.items.get("pathPanel");
        var pathField = pathPanel.items.get("path");
        return pathField.getValue();
    },
    
    setTooltip: function(tooltip) {
        var tooltipPanel = this.items.get("tooltipPanel");
        var tooltipField = tooltipPanel.items.get("tooltip");
        tooltipField.setValue(tooltip ? tooltip : "");
    },

    getTooltip: function() {
        var tooltipPanel = this.items.get("tooltipPanel");
        var tooltipField = tooltipPanel.items.get("tooltip");
        return tooltipField.getValue();
    },

    disableFormElements: function() {
        var titlePanel = this.items.get("titlePanel");
        var titleField = titlePanel.items.get("title");
        titleField.disable();
        
        var pathPanel = this.items.get("pathPanel");
        var pathField = pathPanel.items.get("path");
        pathField.disable();
        
        var overlayLabelPanel = this.items.get("overlayLabelPanel");
        var overlayLabelField = overlayLabelPanel.items.get("overlayLabel");
        overlayLabelField.disable();
        
        var tooltipPanel = this.items.get("tooltipPanel");
        var tooltipField = tooltipPanel.items.get("tooltip");
        tooltipField.disable();
    },

    enableFormElements: function() {
        var titlePanel = this.items.get("titlePanel");
        var titleField = titlePanel.items.get("title");
        titleField.enable();
        
        var pathPanel = this.items.get("pathPanel");
        var pathField = pathPanel.items.get("path");
        pathField.enable();
        
        var overlayLabelPanel = this.items.get("overlayLabelPanel");
        var overlayLabelField = overlayLabelPanel.items.get("overlayLabel");
        overlayLabelField.enable();
        
        var tooltipPanel = this.items.get("tooltipPanel");
        var tooltipField = tooltipPanel.items.get("tooltip");
        tooltipField.enable();
    }

});