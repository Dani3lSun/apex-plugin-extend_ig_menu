# Oracle APEX Dynamic Action Plugin - Extend IG Menu

[![APEX Community](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/78c5adbe/badges/apex-community-badge.svg)](https://github.com/Dani3lSun/apex-github-badges) [![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://github.com/Dani3lSun/apex-github-badges)
[![APEX Built with Love](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/7919f913/badges/apex-love-badge.svg)](https://github.com/Dani3lSun/apex-github-badges)

Dynamic Action Plugin to extend the Standard Row Action Menu (Burger Button) in Interactive Grid (APEX 5.1) with custom Menu Entries.


## Changelog

#### 1.1.1 - Better debug logging, some code improvements

#### 1.1.0 - Add possibility to have column based conditions to hide or disable menu entries. Which adds row level control to the hide/disable functions / changed JQuery methods to native APEX Interactive Grid methods

#### 1.0.0 - Initial Release


## Install

- Import Plugin File **dynamic_action_plugin_de_danielh_extendigmenu.sql** from source Directory into your Application
- (Optional) Deploy the JS and CSS files from **server** Directory on your Webserver and change the **File Prefix** to Webservers Folder.


## Plugin Settings

The Plugin Settings are highly customizable and you can change:
- **Menu Label** - Label of the additional Menu Entry
- **Menu Icon** - Icon of the additional Menu Entry
- **Menu Return Type** - Choose if the Primary Key Value of IG Row is returned into an APEX Item or via a Custom Event which gets triggered
- **Item** - Item which will get the Value of the Primary Key Column of Interactive Grid. After that you can react on the Change Event of the Item and can do things with that.
- **Custom Event** - This will trigger a Custom Event with the Name of this Attribute. So you can react with other Dynamic Actions to this Event. **this.data** holds the PK Value of the Interactive Grid Row (Selection Type: Interactive Grid Region)
- **Render Menu Separator** - Choose if a *Separator* is rendered between the Menu Entries. It is simply a horizontal Line.
- **Hide Condition Type** - Choose whether the Hide Condition is
  - **General**: All IG rows have same condition
  - **Column based**: Have an condition column to have row level control if an menu item is hidden or not
- **Hide Condition** - Condition to Hide the Menu Entry. Item Substitution is supported: &P1_ITEM. (true/false)
- **Hide Condition Column** - Column Name of the IG column which holds the hide condition information. Column return value should be (true/false)
- **Disable Condition Type** - Choose whether the Disable Condition is
  - **General**: All IG rows have same condition
  - **Column based**: Have an condition column to have row level control if an menu item is disabled or not
- **Disable Condition** - Condition to Disable the Menu Entry. Item Substitution is supported: &P1_ITEM. (true/false)
- **Disable Condition Column** - Column Name of the IG column which holds the disable condition information. Column return value should be (true/false)


## How to use
- Create a new Dynamic Action with Event "Page Load"
- As Action choose **Extend IG Menu**
- Choose best fitting Plugin Attributes (Help included)
- Choose as Affected Element the Interactive Grid Region


## Demo Application
[https://apex.oracle.com/pls/apex/f?p=APEXPLUGIN](https://apex.oracle.com/pls/apex/f?p=APEXPLUGIN)


## Preview
## ![](https://github.com/Dani3lSun/apex-plugin-extend_ig_menu/blob/master/preview.gif)
