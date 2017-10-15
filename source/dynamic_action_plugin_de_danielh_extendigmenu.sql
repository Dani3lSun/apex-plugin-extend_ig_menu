set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.2.00.09'
,p_default_workspace_id=>3010964568212465
,p_default_application_id=>600
,p_default_owner=>'APEX_PLUGIN'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/de_danielh_extendigmenu
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(60304554109470347)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'DE.DANIELH.EXTENDIGMENU'
,p_display_name=>'Extend IG Menu'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#extendGridMenu#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * Extend IG Menu functions',
' * Version: 1.1.1 (15.10.2017)',
' * Author:  Daniel Hochleitner',
' *-------------------------------------',
'*/',
'FUNCTION render_extend_ig_menu(p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                               p_plugin         IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_dynamic_action_render_result IS',
'  --',
'  -- plugin attributes',
'  l_result                   apex_plugin.t_dynamic_action_render_result;',
'  l_menu_label               p_dynamic_action.attribute_01%TYPE := p_dynamic_action.attribute_01;',
'  l_menu_icon                p_dynamic_action.attribute_02%TYPE := p_dynamic_action.attribute_02;',
'  l_return_type              p_dynamic_action.attribute_03%TYPE := p_dynamic_action.attribute_03;',
'  l_pk_item                  p_dynamic_action.attribute_04%TYPE := p_dynamic_action.attribute_04;',
'  l_custom_event             p_dynamic_action.attribute_05%TYPE := p_dynamic_action.attribute_05;',
'  l_render_separator         p_dynamic_action.attribute_06%TYPE := p_dynamic_action.attribute_06;',
'  l_hide_condition           p_dynamic_action.attribute_07%TYPE := p_dynamic_action.attribute_07;',
'  l_hide_condition_type      p_dynamic_action.attribute_09%TYPE := p_dynamic_action.attribute_09;',
'  l_hide_condition_column    p_dynamic_action.attribute_10%TYPE := p_dynamic_action.attribute_10;',
'  l_disable_condition        p_dynamic_action.attribute_08%TYPE := p_dynamic_action.attribute_08;',
'  l_disable_condition_type   p_dynamic_action.attribute_11%TYPE := p_dynamic_action.attribute_11;',
'  l_disable_condition_column p_dynamic_action.attribute_12%TYPE := p_dynamic_action.attribute_12;',
'  --',
'BEGIN',
'  -- Debug',
'  IF apex_application.g_debug THEN',
'    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,',
'                                          p_dynamic_action => p_dynamic_action);',
'  END IF;',
'  --',
'  -- Set Defaults and Escape Input',
'  l_menu_label               := apex_escape.html(l_menu_label);',
'  l_menu_icon                := apex_escape.html(l_menu_icon);',
'  l_hide_condition_column    := apex_escape.html(l_hide_condition_column);',
'  l_disable_condition_column := apex_escape.html(l_disable_condition_column);',
'  --',
'  IF lower(l_hide_condition) NOT IN',
'     (''true'',',
'      ''false'') THEN',
'    l_hide_condition := ''false'';',
'  END IF;',
'  IF lower(l_disable_condition) NOT IN',
'     (''true'',',
'      ''false'') THEN',
'    l_disable_condition := ''false'';',
'  END IF;',
'  --',
'  --',
'  l_result.javascript_function := ''extendGridMenu.extendMenu'';',
'  l_result.attribute_01        := l_menu_label;',
'  l_result.attribute_02        := l_menu_icon;',
'  l_result.attribute_03        := l_return_type;',
'  l_result.attribute_04        := upper(l_pk_item);',
'  l_result.attribute_05        := l_custom_event;',
'  l_result.attribute_06        := l_render_separator;',
'  l_result.attribute_07        := lower(nvl(l_hide_condition,',
'                                            ''false''));',
'  l_result.attribute_08        := lower(nvl(l_disable_condition,',
'                                            ''false''));',
'  l_result.attribute_09        := l_hide_condition_type;',
'  l_result.attribute_10        := upper(l_hide_condition_column);',
'  l_result.attribute_11        := l_disable_condition_type;',
'  l_result.attribute_12        := upper(l_disable_condition_column);',
'  --',
'  RETURN l_result;',
'  --',
'END render_extend_ig_menu;'))
,p_api_version=>1
,p_render_function=>'render_extend_ig_menu'
,p_standard_attributes=>'REGION:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Dynamic Action Plugin to extend the Standard Row Action Menu (Burger Button) in Interactive Grid (APEX 5.1) with custom Menu Entries.'
,p_version_identifier=>'1.1.1'
,p_about_url=>'https://github.com/Dani3lSun/apex-plugin-extend_ig_menu'
,p_files_version=>93
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60304733494470349)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Menu Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>true
,p_help_text=>'Label of the additional Menu Entry'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60305117856470350)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Menu Icon'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'icon-up-chevron',
'icon-popup-lov',
'icon-down-chevron',
'icon-menu-split-drop-down',
'icon-region-native-calendar',
'icon-template-calendar',
'icon-item-native-date-picker-classic',
'icon-calendar',
'icon-restore',
'icon-menu-radio',
'icon-irr-dl-email',
'icon-irr-dl-doc',
'icon-ig-dl-html',
'icon-irr-dl-html',
'icon-irr-dl-pdf',
'icon-ig-dl-xls',
'icon-irr-dl-xls',
'icon-ig-actions',
'icon-ig-expand',
'icon-ig-restore',
'icon-ig-data',
'icon-ig-report-settings',
'icon-ig-save',
'icon-ig-save-as',
'icon-ig-edit',
'icon-ig-duplicate',
'icon-ig-delete',
'icon-ig-revert',
'icon-ig-refresh',
'icon-ig-single-row-view',
'icon-ig-frozen-column',
'icon-tree-folder',
'icon-tree-folder-open',
'icon-region-chart-area',
'icon-region-chart-bar',
'icon-region-chart-bubble',
'icon-region-chart-column',
'icon-region-chart-combo',
'icon-region-chart-dial',
'icon-region-chart-donut',
'icon-region-chart-funnel',
'icon-region-chart-gantt',
'icon-region-chart-line-area',
'icon-region-chart-line',
'icon-region-chart-pie',
'icon-region-chart-polar',
'icon-region-chart-radar',
'icon-region-chart-range-area',
'icon-region-chart-range-bar',
'icon-region-chart-scatter',
'icon-region-chart-stock',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Icon of the additional Menu Entry.<br>',
'You can pick a Icon from this Lists:<br>',
'<pre>',
'icon-home',
'icon-debug',
'icon-bug',
'icon-quick-edit',
'icon-edit-page',
'icon-edit-page-alt',
'icon-irr-ws-history',
'icon-page-session',
'icon-coming-soon',
'icon-open-in-dialog',
'icon-page-debug',
'icon-irr-ws-properties',
'icon-grid-layout',
'icon-theme-roller',
'icon-gear',
'icon-edit-app',
'icon-asterisk',
'icon-gears-alt',
'icon-mobile',
'icon-help',
'icon-ig-help',
'icon-irr-help',
'icon-user',
'icon-toolbar-all',
'icon-toolbar-common',
'icon-tr-redo',
'icon-redo',
'icon-tr-undo',
'icon-undo',
'icon-refresh',
'icon-shuttle-reset',
'icon-ig-reset',
'icon-irr-reset',
'icon-tr-reset',
'icon-tr-close',
'icon-tr-fail',
'icon-remove',
'icon-shuttle-move-all',
'icon-shuttle-move-all',
'icon-last',
'icon-last',
'icon-shuttle-bottom',
'icon-tr-collapse',
'icon-install',
'icon-shuttle-down',
'icon-shuttle-top',
'icon-tr-expand',
'icon-shuttle-up',
'icon-breadcrumb-previous',
'icon-shuttle-remove-all',
'icon-shuttle-remove-all',
'icon-top',
'icon-bottom',
'icon-first',
'icon-first',
'icon-tr-contrast',
'icon-menu-scroll-up',
'icon-menu-drop-down',
'icon-menu-scroll-down',
'icon-down-arrow',
'icon-ig-collapse-row',
'icon-irr-collapse-row',
'icon-menu-sub-rtl',
'icon-paginate-prev',
'icon-menu-sub',
'icon-paginate-next',
'icon-color-picker',
'icon-right-arrow',
'icon-ig-expand-row',
'icon-right-arrow',
'icon-ig-expand-row',
'icon-left-arrow',
'icon-left-arrow',
'icon-circle',
'icon-irr-ws-validation',
'icon-check',
'icon-tr-pass',
'icon-menu-check',
'icon-wizard-step-complete',
'icon-warning',
'icon-tr-warning',
'icon-ig-invalid-settings',
'icon-irr-invalid-settings',
'icon-info',
'icon-tr-contrast',
'icon-ig-inactive-settings',
'icon-irr-inactive-settings',
'icon-quick-pick',
'icon-irr-ws-lov',
'icon-ig-no-results',
'icon-irr-no-results',
'icon-search',
'icon-cm-find',
'icon-tools',
'icon-util',
'icon-cm-build-query',
'icon-ig-format',
'icon-irr-format',
'icon-ig-add-row',
'icon-plus',
'icon-irr-ws-row-add',
'icon-irr-ws-col-add',
'icon-minus',
'icon-calculator',
'icon-ig-calculator',
'icon-ig-compute',
'icon-irr-calculator',
'icon-irr-compute',
'icon-tree-computation',
'icon-ig-chart',
'icon-irr-chart',
'icon-ig-control-break',
'icon-irr-control-break',
'icon-ig-details',
'icon-irr-details',
'icon-ig-group-by',
'icon-irr-group-by',
'icon-ig-icons',
'icon-irr-icons',
'icon-ws-page-dir',
'icon-ig-pivot',
'icon-irr-pivot',
'icon-ig-remove-col',
'icon-irr-remove-col',
'icon-ig-report',
'icon-irr-report',
'icon-ig-sort-asc',
'icon-irr-sort-asc',
'icon-rpt-sort-asc',
'icon-ig-sort-desc',
'icon-irr-sort-desc',
'icon-rpt-sort-desc',
'icon-ig-filter',
'icon-irr-filter',
'icon-ig-flashback',
'icon-irr-flashback',
'icon-ig-highlight',
'icon-irr-highlight',
'icon-ig-download',
'icon-irr-download',
'icon-ig-search',
'icon-irr-search',
'icon-ig-saved-report',
'icon-irr-saved-report',
'icon-tree-saved-report',
'icon-ws-file',
'icon-ws-image',
'icon-ws-note',
'icon-irr-ws-col',
'icon-ig-select-cols',
'icon-irr-select-cols',
'icon-tree-report-column',
'icon-irr-ws-toggle-checkboxes',
'icon-cm-replace',
'icon-irr-ws-row-replace',
'icon-irr-ws-row-fill',
'icon-ig-rows',
'icon-irr-rows',
'icon-irr-ws-row',
'icon-ig-aggregate',
'icon-irr-aggregate',
'icon-ig-sort',
'icon-irr-sort',
'icon-ig-subscription',
'icon-irr-subscription',
'icon-irr-ws-properties',
'icon-grid-layout',
'icon-irr-ws-history',
'icon-page-session',
'icon-coming-soon',
'icon-copy',
'icon-irr-ws-copy',
'icon-irr-ws-col-pros',
'icon-irr-ws-col-values',
'icon-irr-ws-col-groups',
'icon-irr-ws-dg-delete',
'icon-irr-ws-col-delete',
'icon-irr-ws-row-delete',
'icon-right-chevron',
'icon-go-to-component',
'icon-shuttle-move',
'icon-next',
'icon-right-chevron',
'icon-shuttle-move',
'icon-next',
'icon-left-chevron',
'icon-shuttle-remove',
'icon-prev',
'icon-left-chevron',
'icon-shuttle-remove',
'icon-prev',
'icon-maximize',
'<pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60331586934049337)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Menu Return Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ITEM'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Choose if the Primary Key Value of IG Row is returned into a Item or via a Custom Event which gets triggered.<br>',
'Note: If you have multiple Primary Keys in the IG than an Array is returned. E.g. ["123456","654321"]'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(60331907566050312)
,p_plugin_attribute_id=>wwv_flow_api.id(60331586934049337)
,p_display_sequence=>10
,p_display_value=>'Set Item Value'
,p_return_value=>'ITEM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(60332279168052303)
,p_plugin_attribute_id=>wwv_flow_api.id(60331586934049337)
,p_display_sequence=>20
,p_display_value=>'Trigger Custom Event'
,p_return_value=>'EVENT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60306400120520940)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(60331586934049337)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Item which will get the Value of the Primary Key Column of Interactive Grid.<br>',
'After that you can react on the Change Event of the Item and can do things with that.<br>',
'Note: If you have multiple Primary Keys in the IG than an Array is returned. E.g. ["123456","654321"]'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60333323256064467)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Custom Event'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(60331586934049337)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'EVENT'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Selection Type / Event Scope is the Interactive Report Region you specified as Affected Elements.<br>',
'"this.data" holds the PK Value of the Interactive Grid Row<br>',
'',
'<pre>',
'var pkValue = this.data;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This will trigger a Custom Event with the Name of this Attribute. So you can react with other Dynamic Actions to this Event.<br>',
'Note: If you have multiple Primary Keys in the IG than an Array is returned. E.g. ["123456","654321"]'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60308102068577175)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Render Menu Separator'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Choose if a "Separator" is rendered between the Menu Entries. It is simply a horizontal Line.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(60308435549577748)
,p_plugin_attribute_id=>wwv_flow_api.id(60308102068577175)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(60308867898578373)
,p_plugin_attribute_id=>wwv_flow_api.id(60308102068577175)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60306766272523088)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Hide Condition'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(55304823065796674)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'GENERAL'
,p_examples=>'"true" or "false" in Lower Case'
,p_help_text=>'Condition to hide the menu entry. Item Substitution is supported: &P1_ITEM.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60306977866525095)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>85
,p_prompt=>'Disable Condition'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'false'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(36877079358572288)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'GENERAL'
,p_examples=>'"true" or "false" in Lower Case'
,p_help_text=>'Condition to disable the menu entry. Item Substitution is supported: &P1_ITEM.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(55304823065796674)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>65
,p_prompt=>'Hide Condition Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'GENERAL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Choose whether the Hide Condition is<br>',
'- General: All IG rows have same condition<br>',
'- Column based: Have an condition column to have row level control if an menu item is hidden or not<br><br>',
'If you go with Column based condition you have to have an IG column which has either <strong>true</strong> or <strong>false</strong> as value'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55306685980798722)
,p_plugin_attribute_id=>wwv_flow_api.id(55304823065796674)
,p_display_sequence=>10
,p_display_value=>'General'
,p_return_value=>'GENERAL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55307131970799871)
,p_plugin_attribute_id=>wwv_flow_api.id(55304823065796674)
,p_display_sequence=>20
,p_display_value=>'Column based'
,p_return_value=>'COLUMN'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(36876517358567443)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>75
,p_prompt=>'Hide Condition Column'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(55304823065796674)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'COLUMN'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Column value should be either <strong>true</strong> or <strong>false</strong> in Lower Case<br>',
'<pre>',
'SELECT CASE',
'         WHEN col1 = ''VALUE'' THEN',
'          ''false''',
'         ELSE',
'          ''true''',
'       END AS hide_condition',
'  FROM mytable',
'</pre>'))
,p_help_text=>'Column Name of the IG column which holds the hide condition information.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(36877079358572288)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>80
,p_prompt=>'Disable Condition Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'GENERAL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Choose whether the Disable Condition is<br>',
'- General: All IG rows have same condition<br>',
'- Column based: Have an condition column to have row level control if an menu item is disabled or not<br><br>',
'If you go with Column based condition you have to have an IG column which has either <strong>true</strong> or <strong>false</strong> as value'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(36877321502572942)
,p_plugin_attribute_id=>wwv_flow_api.id(36877079358572288)
,p_display_sequence=>10
,p_display_value=>'General'
,p_return_value=>'GENERAL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(36877721761573586)
,p_plugin_attribute_id=>wwv_flow_api.id(36877079358572288)
,p_display_sequence=>20
,p_display_value=>'Column based'
,p_return_value=>'COLUMN'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(36878369151578776)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>90
,p_prompt=>'Disable Condition Column'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(36877079358572288)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'COLUMN'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Column value should be either <strong>true</strong> or <strong>false</strong> in Lower Case<br>',
'<pre>',
'SELECT CASE',
'         WHEN col1 = ''VALUE'' THEN',
'          ''false''',
'         ELSE',
'          ''true''',
'       END AS disable_condition',
'  FROM mytable',
'</pre>'))
,p_help_text=>'Column Name of the IG column which holds the disable condition information.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F20457874656E64204947204D656E750A2F2F20417574686F723A2044616E69656C20486F63686C6569746E65720A2F2F2056657273696F6E3A20312E312E310A0A2F2F20676C6F62616C206E616D6573706163650A76617220657874656E64477269';
wwv_flow_api.g_varchar2_table(2) := '644D656E75203D207B0A20202F2F0A20202F2F20706172736520737472696E6720746F20626F6F6C65616E0A20207061727365426F6F6C65616E3A2066756E6374696F6E2870537472696E6729207B0A2020202076617220626F6F6C65616E3B0A202020';
wwv_flow_api.g_varchar2_table(3) := '206966202870537472696E672E746F4C6F776572436173652829203D3D2027747275652729207B0A202020202020626F6F6C65616E203D20747275653B0A202020207D0A202020206966202870537472696E672E746F4C6F776572436173652829203D3D';
wwv_flow_api.g_varchar2_table(4) := '202766616C73652729207B0A202020202020626F6F6C65616E203D2066616C73653B0A202020207D0A2020202069662028212870537472696E672E746F4C6F776572436173652829203D3D202774727565272920262620212870537472696E672E746F4C';
wwv_flow_api.g_varchar2_table(5) := '6F776572436173652829203D3D202766616C7365272929207B0A202020202020626F6F6C65616E203D20756E646566696E65643B0A202020207D0A2020202072657475726E20626F6F6C65616E3B0A20207D2C0A20202F2F0A20202F2F20736574204772';
wwv_flow_api.g_varchar2_table(6) := '696420504B2056616C756520746F204974656D0A2020736574506B4974656D56616C75653A2066756E6374696F6E2870526567696F6E49642C2070477269644F626A6563742C20704974656D29207B0A202020202F2F20676574202F2073657420504B20';
wwv_flow_api.g_varchar2_table(7) := '56616C75650A20202020766172206D6F64656C203D2070477269644F626A6563742E6D6F64656C3B0A20202020766172207265636F7264203D2070477269644F626A6563742E7265636F72643B0A2020202076617220706B56616C7565203D206D6F6465';
wwv_flow_api.g_varchar2_table(8) := '6C2E6765745265636F72644964287265636F7264293B0A20202020247328704974656D2C20706B56616C7565293B0A202020202F2F204C6F6767696E670A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E736574';
wwv_flow_api.g_varchar2_table(9) := '506B4974656D56616C7565202D20706B56616C7565272C20706B56616C7565293B0A20207D2C0A20202F2F0A20202F2F205472696767657220437573746F6D2041504558204576656E74207769746820504B2056616C75650A2020747269676765724375';
wwv_flow_api.g_varchar2_table(10) := '73746F6D4576656E743A2066756E6374696F6E2870526567696F6E49642C2070477269644F626A6563742C20704576656E7429207B0A202020202F2F2067657420504B2056616C75650A20202020766172206D6F64656C203D2070477269644F626A6563';
wwv_flow_api.g_varchar2_table(11) := '742E6D6F64656C3B0A20202020766172207265636F7264203D2070477269644F626A6563742E7265636F72643B0A2020202076617220706B56616C7565203D206D6F64656C2E6765745265636F72644964287265636F7264293B0A202020202F2F205472';
wwv_flow_api.g_varchar2_table(12) := '69676765722041504558204576656E740A20202020617065782E6576656E742E7472696767657228272327202B2070526567696F6E49642C20704576656E742C20706B56616C7565293B0A202020202F2F204C6F6767696E670A20202020617065782E64';
wwv_flow_api.g_varchar2_table(13) := '656275672E6C6F672827657874656E64477269644D656E752E74726967676572437573746F6D4576656E74202D20706B56616C7565272C20706B56616C7565293B0A20207D2C0A20202F2F0A20202F2F204D656E7520416374696F6E2046756E6374696F';
wwv_flow_api.g_varchar2_table(14) := '6E0A20206D656E75416374696F6E3A2066756E6374696F6E2870547970652C2070526567696F6E49642C2070477269644F626A6563742C20704974656D2C20704576656E7429207B0A202020202F2F204C6F6767696E670A20202020617065782E646562';
wwv_flow_api.g_varchar2_table(15) := '75672E6C6F672827657874656E64477269644D656E752E6D656E75416374696F6E202D207054797065272C207054797065293B0A0A20202020696620287054797065203D3D20274954454D2729207B0A202020202020657874656E64477269644D656E75';
wwv_flow_api.g_varchar2_table(16) := '2E736574506B4974656D56616C75652870526567696F6E49642C2070477269644F626A6563742C20704974656D293B0A202020207D20656C736520696620287054797065203D3D20274556454E542729207B0A202020202020657874656E64477269644D';
wwv_flow_api.g_varchar2_table(17) := '656E752E74726967676572437573746F6D4576656E742870526567696F6E49642C2070477269644F626A6563742C20704576656E74293B0A202020207D0A20207D2C0A20202F2F0A20202F2F20616464206D656E75206974656D20746F204947206D656E';
wwv_flow_api.g_varchar2_table(18) := '750A2020616464477269644D656E75456E7472793A2066756E6374696F6E2870477269644F626A6563742C20704D656E754F7074696F6E732C2070536570617261746F7229207B0A202020202F2F20526F7720616374696F6E73206D656E750A20202020';
wwv_flow_api.g_varchar2_table(19) := '7661722067726964203D2070477269644F626A6563742E677269643B0A2020202076617220726F77416374696F6E4D656E7524203D20677269642E726F77416374696F6E4D656E75242E6D656E7528226F7074696F6E22292E6974656D733B0A20202020';
wwv_flow_api.g_varchar2_table(20) := '766172206D656E754974656D436F756E74203D20726F77416374696F6E4D656E75242E6C656E6774683B0A202020202F2F2072656E64657220736570617261746F720A202020206966202870536570617261746F7229207B0A202020202020726F774163';
wwv_flow_api.g_varchar2_table(21) := '74696F6E4D656E75242E73706C696365286D656E754974656D436F756E742C20302C207B0A202020202020202069643A2027736570617261746F72272C0A2020202020202020747970653A2022736570617261746F72222C0A2020202020202020686964';
wwv_flow_api.g_varchar2_table(22) := '653A2066616C73652C0A202020202020202064697361626C65643A2066616C73650A2020202020207D293B0A2020202020206D656E754974656D436F756E74203D206D656E754974656D436F756E74202B20313B0A202020207D0A202020202F2F207365';
wwv_flow_api.g_varchar2_table(23) := '74204944206F66206D656E7520656E7472790A20202020704D656E754F7074696F6E732E6964203D202769672D6D656E752D6974656D2D27202B206D656E754974656D436F756E743B0A202020202F2F204C6F6767696E670A20202020617065782E6465';
wwv_flow_api.g_varchar2_table(24) := '6275672E6C6F672827657874656E64477269644D656E752E616464477269644D656E75456E747279202D20726F77416374696F6E4D656E7524272C20726F77416374696F6E4D656E7524293B0A20202020617065782E64656275672E6C6F672827657874';
wwv_flow_api.g_varchar2_table(25) := '656E64477269644D656E752E616464477269644D656E75456E747279202D206D656E754974656D436F756E74272C206D656E754974656D436F756E74293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E6164';
wwv_flow_api.g_varchar2_table(26) := '64477269644D656E75456E747279202D20704D656E754F7074696F6E73272C20704D656E754F7074696F6E73293B0A202020202F2F20616464206D656E7520656E7472790A20202020726F77416374696F6E4D656E75242E73706C696365286D656E7549';
wwv_flow_api.g_varchar2_table(27) := '74656D436F756E74202B20312C20302C20704D656E754F7074696F6E73293B0A20207D2C0A20202F2F0A20202F2F206D61696E2066756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0A2020657874656E644D65';
wwv_flow_api.g_varchar2_table(28) := '6E753A2066756E6374696F6E2829207B0A202020202F2F20706C7567696E20617474726962757465730A2020202076617220646154686973203D20746869733B0A20202020766172206166666563746564456C656D656E7473203D206461546869732E61';
wwv_flow_api.g_varchar2_table(29) := '66666563746564456C656D656E74733B0A20202020766172206D656E754C6162656C203D206461546869732E616374696F6E2E61747472696275746530313B0A20202020766172206D656E7549636F6E203D206461546869732E616374696F6E2E617474';
wwv_flow_api.g_varchar2_table(30) := '72696275746530323B0A202020207661722072657475726E54797065203D206461546869732E616374696F6E2E61747472696275746530333B0A2020202076617220706B4974656D203D206461546869732E616374696F6E2E6174747269627574653034';
wwv_flow_api.g_varchar2_table(31) := '3B0A2020202076617220637573746F6D4576656E74203D206461546869732E616374696F6E2E61747472696275746530353B0A202020207661722072656E646572536570617261746F72203D20657874656E64477269644D656E752E7061727365426F6F';
wwv_flow_api.g_varchar2_table(32) := '6C65616E286461546869732E616374696F6E2E6174747269627574653036293B0A202020207661722068696465436F6E646974696F6E54797065203D206461546869732E616374696F6E2E61747472696275746530393B0A202020207661722068696465';
wwv_flow_api.g_varchar2_table(33) := '436F6E646974696F6E203D20657874656E64477269644D656E752E7061727365426F6F6C65616E286461546869732E616374696F6E2E6174747269627574653037293B0A202020207661722068696465436F6E646974696F6E436F6C756D6E203D206461';
wwv_flow_api.g_varchar2_table(34) := '546869732E616374696F6E2E61747472696275746531303B0A202020207661722064697361626C65436F6E646974696F6E54797065203D206461546869732E616374696F6E2E61747472696275746531313B0A202020207661722064697361626C65436F';
wwv_flow_api.g_varchar2_table(35) := '6E646974696F6E203D20657874656E64477269644D656E752E7061727365426F6F6C65616E286461546869732E616374696F6E2E6174747269627574653038293B0A202020207661722064697361626C65436F6E646974696F6E436F6C756D6E203D2064';
wwv_flow_api.g_varchar2_table(36) := '61546869732E616374696F6E2E61747472696275746531323B0A0A2020202076617220726567696F6E4964203D206166666563746564456C656D656E74735B305D2E69643B0A202020202F2F20496E74657261637469766520477269640A202020207661';
wwv_flow_api.g_varchar2_table(37) := '7220776964676574203D20617065782E726567696F6E28726567696F6E4964292E77696467657428293B0A202020207661722067726964203D207769646765742E696E7465726163746976654772696428276765745669657773272C2027677269642729';
wwv_flow_api.g_varchar2_table(38) := '3B0A20202020766172206D6F64656C203D20677269642E6D6F64656C3B0A0A2020202076617220677269644F626A656374203D207B0A2020202020207769646765743A207769646765742C0A202020202020677269643A20677269642C0A202020202020';
wwv_flow_api.g_varchar2_table(39) := '6D6F64656C3A206D6F64656C2C0A2020202020207265636F72643A206E756C6C0A202020207D3B0A0A202020202F2F204C6F6767696E670A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E';
wwv_flow_api.g_varchar2_table(40) := '75202D206166666563746564456C656D656E7473272C206166666563746564456C656D656E7473293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D206D656E754C6162656C27';
wwv_flow_api.g_varchar2_table(41) := '2C206D656E754C6162656C293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D2072657475726E54797065272C2072657475726E54797065293B0A20202020617065782E646562';
wwv_flow_api.g_varchar2_table(42) := '75672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D206D656E7549636F6E272C206D656E7549636F6E293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D';
wwv_flow_api.g_varchar2_table(43) := '656E75202D20706B4974656D272C20706B4974656D293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D20637573746F6D4576656E74272C20637573746F6D4576656E74293B0A';
wwv_flow_api.g_varchar2_table(44) := '20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D2072656E646572536570617261746F72272C2072656E646572536570617261746F72293B0A20202020617065782E64656275672E6C';
wwv_flow_api.g_varchar2_table(45) := '6F672827657874656E64477269644D656E752E657874656E644D656E75202D2068696465436F6E646974696F6E54797065272C2068696465436F6E646974696F6E54797065293B0A20202020617065782E64656275672E6C6F672827657874656E644772';
wwv_flow_api.g_varchar2_table(46) := '69644D656E752E657874656E644D656E75202D2068696465436F6E646974696F6E272C2068696465436F6E646974696F6E293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D20';
wwv_flow_api.g_varchar2_table(47) := '68696465436F6E646974696F6E436F6C756D6E272C2068696465436F6E646974696F6E436F6C756D6E293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D2064697361626C6543';
wwv_flow_api.g_varchar2_table(48) := '6F6E646974696F6E54797065272C2064697361626C65436F6E646974696F6E54797065293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D2064697361626C65436F6E64697469';
wwv_flow_api.g_varchar2_table(49) := '6F6E272C2064697361626C65436F6E646974696F6E293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D2064697361626C65436F6E646974696F6E436F6C756D6E272C20646973';
wwv_flow_api.g_varchar2_table(50) := '61626C65436F6E646974696F6E436F6C756D6E293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D20726567696F6E4964272C20726567696F6E4964293B0A2020202061706578';
wwv_flow_api.g_varchar2_table(51) := '2E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D20494720776964676574272C20776964676574293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E65787465';
wwv_flow_api.g_varchar2_table(52) := '6E644D656E75202D2049472067726964272C2067726964293B0A20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D204947206D6F64656C272C206D6F64656C293B0A0A0A202020202F';
wwv_flow_api.g_varchar2_table(53) := '2F2048696465202F2044697361626C652047656E6572616C204D6F64652028616C6C20526F7773290A20202020766172206D656E7548696465203D2066616C73653B0A202020206966202868696465436F6E646974696F6E54797065203D3D202747454E';
wwv_flow_api.g_varchar2_table(54) := '4552414C2729207B0A2020202020206D656E7548696465203D2068696465436F6E646974696F6E3B0A202020207D0A20202020766172206D656E7544697361626C65203D2066616C73653B0A202020206966202864697361626C65436F6E646974696F6E';
wwv_flow_api.g_varchar2_table(55) := '54797065203D3D202747454E4552414C2729207B0A2020202020206D656E7544697361626C65203D2064697361626C65436F6E646974696F6E3B0A202020207D0A0A0A202020202F2F206275696C64206D656E75206F7074696F6E73206F626A6563740A';
wwv_flow_api.g_varchar2_table(56) := '20202020766172206D656E754F7074696F6E73203D207B0A20202020202069636F6E3A206D656E7549636F6E2C0A20202020202069643A202769672D6D656E752D6974656D272C0A2020202020206C6162656C3A206D656E754C6162656C2C0A20202020';
wwv_flow_api.g_varchar2_table(57) := '2020747970653A2022616374696F6E222C0A202020202020616374696F6E3A2066756E6374696F6E286D656E752C20656C656D656E7429207B0A2020202020202020766172207265636F7264203D20677269642E676574436F6E746578745265636F7264';
wwv_flow_api.g_varchar2_table(58) := '28656C656D656E74295B305D3B0A2020202020202020677269644F626A6563742E7265636F7264203D207265636F72643B0A2020202020202020657874656E64477269644D656E752E6D656E75416374696F6E2872657475726E547970652C2072656769';
wwv_flow_api.g_varchar2_table(59) := '6F6E49642C20677269644F626A6563742C20706B4974656D2C20637573746F6D4576656E74293B0A2020202020207D2C0A202020202020686964653A206D656E75486964652C0A20202020202064697361626C65643A206D656E7544697361626C650A20';
wwv_flow_api.g_varchar2_table(60) := '2020207D3B0A0A202020202F2F20616464206D656E75206974656D0A20202020657874656E64477269644D656E752E616464477269644D656E75456E74727928677269644F626A6563742C206D656E754F7074696F6E732C2072656E6465725365706172';
wwv_flow_api.g_varchar2_table(61) := '61746F72293B0A0A202020202F2F2048696465202F2044697361626C6520436F6C756D6E204D6F6465202873696E676C6520526F77732C20436F6E646974696F6E20436F6C756D6E206261736564290A202020206966202868696465436F6E646974696F';
wwv_flow_api.g_varchar2_table(62) := '6E54797065203D3D2027434F4C554D4E27207C7C2064697361626C65436F6E646974696F6E54797065203D3D2027434F4C554D4E2729207B0A2020202020202F2F2073617665206D656E7520627574746F6E2C2077696C6C206E65656420697420666F72';
wwv_flow_api.g_varchar2_table(63) := '20677269642E676574436F6E746578745265636F72640A20202020202076617220636C69636B65644D656E75427574746F6E3B0A2020202020202428272327202B20726567696F6E4964292E636C69636B2827627574746F6E5B646174612D6D656E753D';
wwv_flow_api.g_varchar2_table(64) := '2227202B20726567696F6E4964202B20275F69675F726F775F616374696F6E735F6D656E75225D272C2066756E6374696F6E286576656E7429207B0A2020202020202020636C69636B65644D656E75427574746F6E203D206576656E742E746172676574';
wwv_flow_api.g_varchar2_table(65) := '3B0A20202020202020202F2F204C6F6767696E670A2020202020202020617065782E64656275672E6C6F6728276D656E7520627574746F6E20636C69636B202D206576656E742E746172676574272C20636C69636B65644D656E75427574746F6E293B0A';
wwv_flow_api.g_varchar2_table(66) := '2020202020207D293B0A2020202020202F2F206F70656E20616374696F6E206D656E75206576656E740A202020202020677269642E726F77416374696F6E4D656E75242E6F6E28276D656E756265666F72656F70656E272C2066756E6374696F6E286576';
wwv_flow_api.g_varchar2_table(67) := '656E742C20756929207B0A20202020202020202F2F2067657420636F6E74657874207265636F7264206F6620726F770A2020202020202020766172207265636F7264203D20677269642E676574436F6E746578745265636F726428636C69636B65644D65';
wwv_flow_api.g_varchar2_table(68) := '6E75427574746F6E295B305D3B0A2020202020202020677269644F626A6563742E7265636F7264203D207265636F72643B0A20202020202020202F2F20686964650A20202020202020206966202868696465436F6E646974696F6E54797065203D3D2027';
wwv_flow_api.g_varchar2_table(69) := '434F4C554D4E2729207B0A2020202020202020202076617220697348696464656E203D20657874656E64477269644D656E752E7061727365426F6F6C65616E286D6F64656C2E67657456616C7565287265636F72642C2068696465436F6E646974696F6E';
wwv_flow_api.g_varchar2_table(70) := '436F6C756D6E2929207C7C2066616C73653B0A20202020202020202020242E677265702875692E6D656E752E6974656D732C2066756E6374696F6E286529207B0A20202020202020202020202069662028652E6964203D3D206D656E754F7074696F6E73';
wwv_flow_api.g_varchar2_table(71) := '2E696429207B0A2020202020202020202020202020652E68696465203D20697348696464656E3B0A2020202020202020202020207D0A202020202020202020207D293B0A20202020202020207D0A20202020202020202F2F2064697361626C650A202020';
wwv_flow_api.g_varchar2_table(72) := '20202020206966202864697361626C65436F6E646974696F6E54797065203D3D2027434F4C554D4E2729207B0A2020202020202020202076617220697344697361626C6564203D20657874656E64477269644D656E752E7061727365426F6F6C65616E28';
wwv_flow_api.g_varchar2_table(73) := '6D6F64656C2E67657456616C7565287265636F72642C2064697361626C65436F6E646974696F6E436F6C756D6E2929207C7C2066616C73653B0A20202020202020202020242E677265702875692E6D656E752E6974656D732C2066756E6374696F6E2865';
wwv_flow_api.g_varchar2_table(74) := '29207B0A20202020202020202020202069662028652E6964203D3D206D656E754F7074696F6E732E696429207B0A2020202020202020202020202020652E64697361626C6564203D20697344697361626C65643B0A2020202020202020202020207D0A20';
wwv_flow_api.g_varchar2_table(75) := '2020202020202020207D293B0A20202020202020207D0A20202020202020202F2F204C6F6767696E670A2020202020202020617065782E64656275672E6C6F672827677269642E726F77416374696F6E4D656E7524206D656E756265666F72656F70656E';
wwv_flow_api.g_varchar2_table(76) := '202D2074686973272C2074686973293B0A2020202020202020617065782E64656275672E6C6F672827677269642E726F77416374696F6E4D656E7524206D656E756265666F72656F70656E202D206576656E74272C206576656E74293B0A202020202020';
wwv_flow_api.g_varchar2_table(77) := '2020617065782E64656275672E6C6F672827677269642E726F77416374696F6E4D656E7524206D656E756265666F72656F70656E202D207569272C207569293B0A2020202020202020617065782E64656275672E6C6F672827677269642E726F77416374';
wwv_flow_api.g_varchar2_table(78) := '696F6E4D656E7524206D656E756265666F72656F70656E202D207265636F7264272C207265636F7264293B0A2020202020207D293B0A202020207D0A20207D0A7D3B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(60309548955684648)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_file_name=>'extendGridMenu.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '76617220657874656E64477269644D656E753D7B7061727365426F6F6C65616E3A66756E6374696F6E2861297B76617220623B2274727565223D3D612E746F4C6F776572436173652829262628623D2130293B2266616C7365223D3D612E746F4C6F7765';
wwv_flow_api.g_varchar2_table(2) := '72436173652829262628623D2131293B227472756522213D612E746F4C6F77657243617365282926262266616C736522213D612E746F4C6F776572436173652829262628623D766F69642030293B72657475726E20627D2C736574506B4974656D56616C';
wwv_flow_api.g_varchar2_table(3) := '75653A66756E6374696F6E28612C622C63297B613D622E6D6F64656C2E6765745265636F7264496428622E7265636F7264293B247328632C61293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E736574506B4974656D56';
wwv_flow_api.g_varchar2_table(4) := '616C7565202D20706B56616C7565222C61297D2C74726967676572437573746F6D4576656E743A66756E6374696F6E28612C622C63297B623D622E6D6F64656C2E6765745265636F7264496428622E7265636F7264293B617065782E6576656E742E7472';
wwv_flow_api.g_varchar2_table(5) := '6967676572282223222B612C632C62293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E74726967676572437573746F6D4576656E74202D20706B56616C7565222C62297D2C6D656E75416374696F6E3A66756E6374696F';
wwv_flow_api.g_varchar2_table(6) := '6E28612C0A622C632C642C68297B617065782E64656275672E6C6F672822657874656E64477269644D656E752E6D656E75416374696F6E202D207054797065222C61293B224954454D223D3D613F657874656E64477269644D656E752E736574506B4974';
wwv_flow_api.g_varchar2_table(7) := '656D56616C756528622C632C64293A224556454E54223D3D612626657874656E64477269644D656E752E74726967676572437573746F6D4576656E7428622C632C68297D2C616464477269644D656E75456E7472793A66756E6374696F6E28612C622C63';
wwv_flow_api.g_varchar2_table(8) := '297B613D612E677269642E726F77416374696F6E4D656E75242E6D656E7528226F7074696F6E22292E6974656D733B76617220643D612E6C656E6774683B63262628612E73706C69636528642C302C7B69643A22736570617261746F72222C747970653A';
wwv_flow_api.g_varchar2_table(9) := '22736570617261746F72222C686964653A21312C64697361626C65643A21317D292C642B3D31293B622E69643D2269672D6D656E752D6974656D2D222B643B617065782E64656275672E6C6F672822657874656E64477269644D656E752E616464477269';
wwv_flow_api.g_varchar2_table(10) := '644D656E75456E747279202D20726F77416374696F6E4D656E7524222C61293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E616464477269644D656E75456E747279202D206D656E754974656D436F756E74222C64293B';
wwv_flow_api.g_varchar2_table(11) := '617065782E64656275672E6C6F672822657874656E64477269644D656E752E616464477269644D656E75456E747279202D20704D656E754F7074696F6E73222C0A62293B612E73706C69636528642B312C302C62297D2C657874656E644D656E753A6675';
wwv_flow_api.g_varchar2_table(12) := '6E6374696F6E28297B76617220613D746869732E6166666563746564456C656D656E74732C623D746869732E616374696F6E2E61747472696275746530312C633D746869732E616374696F6E2E61747472696275746530322C643D746869732E61637469';
wwv_flow_api.g_varchar2_table(13) := '6F6E2E61747472696275746530332C683D746869732E616374696F6E2E61747472696275746530342C743D746869732E616374696F6E2E61747472696275746530352C753D657874656E64477269644D656E752E7061727365426F6F6C65616E28746869';
wwv_flow_api.g_varchar2_table(14) := '732E616374696F6E2E6174747269627574653036292C6B3D746869732E616374696F6E2E61747472696275746530392C653D657874656E64477269644D656E752E7061727365426F6F6C65616E28746869732E616374696F6E2E61747472696275746530';
wwv_flow_api.g_varchar2_table(15) := '37292C763D746869732E616374696F6E2E61747472696275746531302C6C3D746869732E616374696F6E2E61747472696275746531312C773D657874656E64477269644D656E752E7061727365426F6F6C65616E28746869732E616374696F6E2E617474';
wwv_flow_api.g_varchar2_table(16) := '7269627574653038292C783D746869732E616374696F6E2E61747472696275746531322C673D615B305D2E69642C703D617065782E726567696F6E2867292E77696467657428292C0A663D702E696E746572616374697665477269642822676574566965';
wwv_flow_api.g_varchar2_table(17) := '7773222C226772696422292C6D3D662E6D6F64656C2C6E3D7B7769646765743A702C677269643A662C6D6F64656C3A6D2C7265636F72643A6E756C6C7D3B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D';
wwv_flow_api.g_varchar2_table(18) := '656E75202D206166666563746564456C656D656E7473222C61293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D206D656E754C6162656C222C62293B617065782E64656275672E6C6F6728';
wwv_flow_api.g_varchar2_table(19) := '22657874656E64477269644D656E752E657874656E644D656E75202D2072657475726E54797065222C64293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D206D656E7549636F6E222C6329';
wwv_flow_api.g_varchar2_table(20) := '3B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D20706B4974656D222C68293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D20';
wwv_flow_api.g_varchar2_table(21) := '637573746F6D4576656E74222C74293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D2072656E646572536570617261746F72222C0A75293B617065782E64656275672E6C6F672822657874';
wwv_flow_api.g_varchar2_table(22) := '656E64477269644D656E752E657874656E644D656E75202D2068696465436F6E646974696F6E54797065222C6B293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D2068696465436F6E6469';
wwv_flow_api.g_varchar2_table(23) := '74696F6E222C65293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D2068696465436F6E646974696F6E436F6C756D6E222C76293B617065782E64656275672E6C6F672822657874656E6447';
wwv_flow_api.g_varchar2_table(24) := '7269644D656E752E657874656E644D656E75202D2064697361626C65436F6E646974696F6E54797065222C6C293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D2064697361626C65436F6E';
wwv_flow_api.g_varchar2_table(25) := '646974696F6E222C77293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D2064697361626C65436F6E646974696F6E436F6C756D6E222C78293B617065782E64656275672E6C6F6728226578';
wwv_flow_api.g_varchar2_table(26) := '74656E64477269644D656E752E657874656E644D656E75202D20726567696F6E4964222C67293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D20494720776964676574222C0A70293B6170';
wwv_flow_api.g_varchar2_table(27) := '65782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D2049472067726964222C66293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D204947';
wwv_flow_api.g_varchar2_table(28) := '206D6F64656C222C6D293B613D21313B2247454E4552414C223D3D6B262628613D65293B653D21313B2247454E4552414C223D3D6C262628653D77293B76617220713D7B69636F6E3A632C69643A2269672D6D656E752D6974656D222C6C6162656C3A62';
wwv_flow_api.g_varchar2_table(29) := '2C747970653A22616374696F6E222C616374696F6E3A66756E6374696F6E28612C62297B76617220633D662E676574436F6E746578745265636F72642862295B305D3B6E2E7265636F72643D633B657874656E64477269644D656E752E6D656E75416374';
wwv_flow_api.g_varchar2_table(30) := '696F6E28642C672C6E2C682C74297D2C686964653A612C64697361626C65643A657D3B657874656E64477269644D656E752E616464477269644D656E75456E747279286E2C712C75293B69662822434F4C554D4E223D3D6B7C7C22434F4C554D4E223D3D';
wwv_flow_api.g_varchar2_table(31) := '6C297B76617220723B24282223222B67292E636C69636B2827627574746F6E5B646174612D6D656E753D22272B672B275F69675F726F775F616374696F6E735F6D656E75225D272C66756E6374696F6E2861297B723D612E7461726765743B617065782E';
wwv_flow_api.g_varchar2_table(32) := '64656275672E6C6F6728226D656E7520627574746F6E20636C69636B202D206576656E742E746172676574222C0A72297D293B662E726F77416374696F6E4D656E75242E6F6E28226D656E756265666F72656F70656E222C66756E6374696F6E28612C62';
wwv_flow_api.g_varchar2_table(33) := '297B76617220633D662E676574436F6E746578745265636F72642872295B305D3B6E2E7265636F72643D633B69662822434F4C554D4E223D3D6B297B76617220643D657874656E64477269644D656E752E7061727365426F6F6C65616E286D2E67657456';
wwv_flow_api.g_varchar2_table(34) := '616C756528632C7629297C7C21313B242E6772657028622E6D656E752E6974656D732C66756E6374696F6E2861297B612E69643D3D712E6964262628612E686964653D64297D297D69662822434F4C554D4E223D3D6C297B76617220653D657874656E64';
wwv_flow_api.g_varchar2_table(35) := '477269644D656E752E7061727365426F6F6C65616E286D2E67657456616C756528632C7829297C7C21313B242E6772657028622E6D656E752E6974656D732C66756E6374696F6E2861297B612E69643D3D712E6964262628612E64697361626C65643D65';
wwv_flow_api.g_varchar2_table(36) := '297D297D617065782E64656275672E6C6F672822677269642E726F77416374696F6E4D656E7524206D656E756265666F72656F70656E202D2074686973222C74686973293B617065782E64656275672E6C6F672822677269642E726F77416374696F6E4D';
wwv_flow_api.g_varchar2_table(37) := '656E7524206D656E756265666F72656F70656E202D206576656E74222C61293B617065782E64656275672E6C6F672822677269642E726F77416374696F6E4D656E7524206D656E756265666F72656F70656E202D207569222C0A62293B617065782E6465';
wwv_flow_api.g_varchar2_table(38) := '6275672E6C6F672822677269642E726F77416374696F6E4D656E7524206D656E756265666F72656F70656E202D207265636F7264222C63297D297D7D7D3B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(60309859274684676)
,p_plugin_id=>wwv_flow_api.id(60304554109470347)
,p_file_name=>'extendGridMenu.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
