// Extend IG Menu
// Author: Daniel Hochleitner
// Version: 1.1.1

// global namespace
var extendGridMenu = {
  //
  // parse string to boolean
  parseBoolean: function(pString) {
    var boolean;
    if (pString.toLowerCase() == 'true') {
      boolean = true;
    }
    if (pString.toLowerCase() == 'false') {
      boolean = false;
    }
    if (!(pString.toLowerCase() == 'true') && !(pString.toLowerCase() == 'false')) {
      boolean = undefined;
    }
    return boolean;
  },
  //
  // set Grid PK Value to Item
  setPkItemValue: function(pRegionId, pGridObject, pItem) {
    // get / set PK Value
    var model = pGridObject.model;
    var record = pGridObject.record;
    var pkValue = model.getRecordId(record);
    $s(pItem, pkValue);
    // Logging
    apex.debug.log('extendGridMenu.setPkItemValue - pkValue', pkValue);
  },
  //
  // Trigger Custom APEX Event with PK Value
  triggerCustomEvent: function(pRegionId, pGridObject, pEvent) {
    // get PK Value
    var model = pGridObject.model;
    var record = pGridObject.record;
    var pkValue = model.getRecordId(record);
    // Trigger APEX Event
    apex.event.trigger('#' + pRegionId, pEvent, pkValue);
    // Logging
    apex.debug.log('extendGridMenu.triggerCustomEvent - pkValue', pkValue);
  },
  //
  // Menu Action Function
  menuAction: function(pType, pRegionId, pGridObject, pItem, pEvent) {
    // Logging
    apex.debug.log('extendGridMenu.menuAction - pType', pType);

    if (pType == 'ITEM') {
      extendGridMenu.setPkItemValue(pRegionId, pGridObject, pItem);
    } else if (pType == 'EVENT') {
      extendGridMenu.triggerCustomEvent(pRegionId, pGridObject, pEvent);
    }
  },
  //
  // add menu item to IG menu
  addGridMenuEntry: function(pGridObject, pMenuOptions, pSeparator) {
    // Row actions menu
    var grid = pGridObject.grid;
    var rowActionMenu$ = grid.rowActionMenu$.menu("option").items;
    var menuItemCount = rowActionMenu$.length;
    // render separator
    if (pSeparator) {
      rowActionMenu$.splice(menuItemCount, 0, {
        id: 'separator',
        type: "separator",
        hide: false,
        disabled: false
      });
      menuItemCount = menuItemCount + 1;
    }
    // set ID of menu entry
    pMenuOptions.id = 'ig-menu-item-' + menuItemCount;
    // Logging
    apex.debug.log('extendGridMenu.addGridMenuEntry - rowActionMenu$', rowActionMenu$);
    apex.debug.log('extendGridMenu.addGridMenuEntry - menuItemCount', menuItemCount);
    apex.debug.log('extendGridMenu.addGridMenuEntry - pMenuOptions', pMenuOptions);
    // add menu entry
    rowActionMenu$.splice(menuItemCount + 1, 0, pMenuOptions);
  },
  //
  // main function that gets called from plugin
  extendMenu: function() {
    // plugin attributes
    var daThis = this;
    var affectedElements = daThis.affectedElements;
    var menuLabel = daThis.action.attribute01;
    var menuIcon = daThis.action.attribute02;
    var returnType = daThis.action.attribute03;
    var pkItem = daThis.action.attribute04;
    var customEvent = daThis.action.attribute05;
    var renderSeparator = extendGridMenu.parseBoolean(daThis.action.attribute06);
    var hideConditionType = daThis.action.attribute09;
    var hideCondition = extendGridMenu.parseBoolean(daThis.action.attribute07);
    var hideConditionColumn = daThis.action.attribute10;
    var disableConditionType = daThis.action.attribute11;
    var disableCondition = extendGridMenu.parseBoolean(daThis.action.attribute08);
    var disableConditionColumn = daThis.action.attribute12;

    var regionId = affectedElements[0].id;
    // Interactive Grid
    var widget = apex.region(regionId).widget();
    var grid = widget.interactiveGrid('getViews', 'grid');
    var model = grid.model;

    var gridObject = {
      widget: widget,
      grid: grid,
      model: model,
      record: null
    };

    // Logging
    apex.debug.log('extendGridMenu.extendMenu - affectedElements', affectedElements);
    apex.debug.log('extendGridMenu.extendMenu - menuLabel', menuLabel);
    apex.debug.log('extendGridMenu.extendMenu - returnType', returnType);
    apex.debug.log('extendGridMenu.extendMenu - menuIcon', menuIcon);
    apex.debug.log('extendGridMenu.extendMenu - pkItem', pkItem);
    apex.debug.log('extendGridMenu.extendMenu - customEvent', customEvent);
    apex.debug.log('extendGridMenu.extendMenu - renderSeparator', renderSeparator);
    apex.debug.log('extendGridMenu.extendMenu - hideConditionType', hideConditionType);
    apex.debug.log('extendGridMenu.extendMenu - hideCondition', hideCondition);
    apex.debug.log('extendGridMenu.extendMenu - hideConditionColumn', hideConditionColumn);
    apex.debug.log('extendGridMenu.extendMenu - disableConditionType', disableConditionType);
    apex.debug.log('extendGridMenu.extendMenu - disableCondition', disableCondition);
    apex.debug.log('extendGridMenu.extendMenu - disableConditionColumn', disableConditionColumn);
    apex.debug.log('extendGridMenu.extendMenu - regionId', regionId);
    apex.debug.log('extendGridMenu.extendMenu - IG widget', widget);
    apex.debug.log('extendGridMenu.extendMenu - IG grid', grid);
    apex.debug.log('extendGridMenu.extendMenu - IG model', model);


    // Hide / Disable General Mode (all Rows)
    var menuHide = false;
    if (hideConditionType == 'GENERAL') {
      menuHide = hideCondition;
    }
    var menuDisable = false;
    if (disableConditionType == 'GENERAL') {
      menuDisable = disableCondition;
    }


    // build menu options object
    var menuOptions = {
      icon: menuIcon,
      id: 'ig-menu-item',
      label: menuLabel,
      type: "action",
      action: function(menu, element) {
        var record = grid.getContextRecord(element)[0];
        gridObject.record = record;
        extendGridMenu.menuAction(returnType, regionId, gridObject, pkItem, customEvent);
      },
      hide: menuHide,
      disabled: menuDisable
    };

    // add menu item
    extendGridMenu.addGridMenuEntry(gridObject, menuOptions, renderSeparator);

    // Hide / Disable Column Mode (single Rows, Condition Column based)
    if (hideConditionType == 'COLUMN' || disableConditionType == 'COLUMN') {
      // save menu button, will need it for grid.getContextRecord
      var clickedMenuButton;
      $('#' + regionId).click('button[data-menu="' + regionId + '_ig_row_actions_menu"]', function(event) {
        clickedMenuButton = event.target;
        // Logging
        apex.debug.log('menu button click - event.target', clickedMenuButton);
      });
      // open action menu event
      grid.rowActionMenu$.on('menubeforeopen', function(event, ui) {
        // get context record of row
        var record = grid.getContextRecord(clickedMenuButton)[0];
        gridObject.record = record;
        // hide
        if (hideConditionType == 'COLUMN') {
          var isHidden = extendGridMenu.parseBoolean(model.getValue(record, hideConditionColumn)) || false;
          $.grep(ui.menu.items, function(e) {
            if (e.id == menuOptions.id) {
              e.hide = isHidden;
            }
          });
        }
        // disable
        if (disableConditionType == 'COLUMN') {
          var isDisabled = extendGridMenu.parseBoolean(model.getValue(record, disableConditionColumn)) || false;
          $.grep(ui.menu.items, function(e) {
            if (e.id == menuOptions.id) {
              e.disabled = isDisabled;
            }
          });
        }
        // Logging
        apex.debug.log('grid.rowActionMenu$ menubeforeopen - this', this);
        apex.debug.log('grid.rowActionMenu$ menubeforeopen - event', event);
        apex.debug.log('grid.rowActionMenu$ menubeforeopen - ui', ui);
        apex.debug.log('grid.rowActionMenu$ menubeforeopen - record', record);
      });
    }
  }
};
