// Extend IG Menu
// Author: Daniel Hochleitner
// Version: 1.0.0

// global namespace
var extendGridMenu = {
    //
    // parse string to boolean
    parseBoolean: function(pString) {
        var lBoolean;
        if (pString.toLowerCase() == 'true') {
            lBoolean = true;
        }
        if (pString.toLowerCase() == 'false') {
            lBoolean = false;
        }
        if (!(pString.toLowerCase() == 'true') && !(pString.toLowerCase() == 'false')) {
            lBoolean = undefined;
        }
        return lBoolean;
    },
    //
    // set Grid PK Value to Item
    setPkItemValue: function(pRegionId, pItem) {
        // get / set PK Value
        var lRow$ = $('#' + pRegionId + '_ig').find('.js-menuButton.is-active').closest('tr');
        var lPkValue = lRow$.attr('data-id');
        $s(pItem, lPkValue);
        // Logging
        apex.debug.log('extendGridMenu.setPkItemValue - lRow$', lRow$);
        apex.debug.log('extendGridMenu.setPkItemValue - lPkValue', lPkValue);
    },
    //
    // Trigger Custom APEX Event with PK Value
    triggerCustomEvent: function(pRegionId, pEvent) {
        // get PK Value
        var lRow$ = $('#' + pRegionId + '_ig').find('.js-menuButton.is-active').closest('tr');
        var lPkValue = lRow$.attr('data-id');
        // Trigger APEX Event
        apex.event.trigger('#' + pRegionId, pEvent, lPkValue);
        // Logging
        apex.debug.log('extendGridMenu.triggerCustomEvent - lRow$', lRow$);
        apex.debug.log('extendGridMenu.triggerCustomEvent - lPkValue', lPkValue);
    },
    //
    // Menu Action Function
    menuAction: function(pType, pRegionId, pItem, pEvent) {
        // Logging
        apex.debug.log('extendGridMenu.menuAction - pType', pType);

        if (pType == 'ITEM') {
            extendGridMenu.setPkItemValue(pRegionId, pItem);
        } else if (pType == 'EVENT') {
            extendGridMenu.triggerCustomEvent(pRegionId, pEvent);
        }
    },
    //
    // add menu item to IG menu
    addGridMenuEntry: function(pRegionId, pMenuOptions, pSeparator) {
        var lRegionId = pRegionId;
        // Row actions menu
        var lRowActionMenu$ = $("#" + lRegionId + "_ig_row_actions_menu");
        var lMenuItemCount = lRowActionMenu$.data('apex-menu').options.items.length;
        // render separator
        if (pSeparator) {
            lRowActionMenu$.data('apex-menu').options.items.splice(lMenuItemCount, 0, {
                id: 'separator',
                type: "separator",
                hide: false,
                disabled: false
            });
            lMenuItemCount = lMenuItemCount + 1;
        }
        // set ID of menu entry
        pMenuOptions.id = 'ig-menu-item-' + lMenuItemCount;
        // Logging
        apex.debug.log('extendGridMenu.addGridMenuEntry - lRegionId', lRegionId);
        apex.debug.log('extendGridMenu.addGridMenuEntry - lRowActionMenu$', lRowActionMenu$);
        apex.debug.log('extendGridMenu.addGridMenuEntry - menuItemCount', lMenuItemCount);
        apex.debug.log('extendGridMenu.addGridMenuEntry - pMenuOptions', pMenuOptions);
        // add menu entry
        lRowActionMenu$.data('apex-menu').options.items.splice(lMenuItemCount + 1, 0, pMenuOptions);
    },
    //
    // main function that gets called from plugin
    extendMenu: function() {
        // plugin attributes
        var daThis = this;
        var vAffectedElements = daThis.affectedElements;
        var vMenuLabel = daThis.action.attribute01;
        var vMenuIcon = daThis.action.attribute02;
        var vReturnType = daThis.action.attribute03;
        var vPkItem = daThis.action.attribute04;
        var vCustomEvent = daThis.action.attribute05;
        var vRenderSeparator = extendGridMenu.parseBoolean(daThis.action.attribute06);
        var vHideCondition = extendGridMenu.parseBoolean(daThis.action.attribute07);
        var vDisableCondition = extendGridMenu.parseBoolean(daThis.action.attribute08);

        var lRegionId = vAffectedElements[0].id;

        // Logging
        apex.debug.log('extendGridMenu.extendMenu - vAffectedElements', vAffectedElements);
        apex.debug.log('extendGridMenu.extendMenu - vMenuLabel', vMenuLabel);
        apex.debug.log('extendGridMenu.extendMenu - vReturnType', vReturnType);
        apex.debug.log('extendGridMenu.extendMenu - vMenuIcon', vMenuIcon);
        apex.debug.log('extendGridMenu.extendMenu - vPkItem', vPkItem);
        apex.debug.log('extendGridMenu.extendMenu - vCustomEvent', vCustomEvent);
        apex.debug.log('extendGridMenu.extendMenu - vRenderSeparator', vRenderSeparator);
        apex.debug.log('extendGridMenu.extendMenu - vHideCondition', vHideCondition);
        apex.debug.log('extendGridMenu.extendMenu - vDisableCondition', vDisableCondition);
        apex.debug.log('extendGridMenu.extendMenu - lRegionId', lRegionId);

        // build menu options object
        var vMenuOptions = {
            icon: vMenuIcon,
            id: 'ig-menu-item',
            label: vMenuLabel,
            type: "action",
            action: function() {
                extendGridMenu.menuAction(vReturnType, lRegionId, vPkItem, vCustomEvent);
            },
            hide: vHideCondition,
            disabled: vDisableCondition
        };

        // add menu item
        extendGridMenu.addGridMenuEntry(lRegionId, vMenuOptions, vRenderSeparator);
    }
};
