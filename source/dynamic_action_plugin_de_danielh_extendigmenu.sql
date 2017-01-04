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
,p_release=>'5.1.0.00.45'
,p_default_workspace_id=>1983430837353643
,p_default_application_id=>600
,p_default_owner=>'DEMO'
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
 p_id=>wwv_flow_api.id(23428581641913451)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'DE.DANIELH.EXTENDIGMENU'
,p_display_name=>'Extend IG Menu'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#extendGridMenu#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * Extend IG Menu functions',
' * Version: 1.0.0 (04.01.2017)',
' * Author:  Daniel Hochleitner',
' *-------------------------------------',
'*/',
'FUNCTION render_extend_ig_menu(p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                               p_plugin         IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_dynamic_action_render_result IS',
'  --',
'  -- plugin attributes',
'  l_result            apex_plugin.t_dynamic_action_render_result;',
'  l_menu_label        p_dynamic_action.attribute_01%TYPE := p_dynamic_action.attribute_01;',
'  l_menu_icon         p_dynamic_action.attribute_02%TYPE := p_dynamic_action.attribute_02;',
'  l_return_type       p_dynamic_action.attribute_03%TYPE := p_dynamic_action.attribute_03;',
'  l_pk_item           p_dynamic_action.attribute_04%TYPE := p_dynamic_action.attribute_04;',
'  l_custom_event      p_dynamic_action.attribute_05%TYPE := p_dynamic_action.attribute_05;',
'  l_render_separator  p_dynamic_action.attribute_06%TYPE := p_dynamic_action.attribute_06;',
'  l_hide_condition    p_dynamic_action.attribute_07%TYPE := p_dynamic_action.attribute_07;',
'  l_disable_condition p_dynamic_action.attribute_08%TYPE := p_dynamic_action.attribute_08;',
'  --',
'BEGIN',
'  -- Debug',
'  IF apex_application.g_debug THEN',
'    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,',
'                                          p_dynamic_action => p_dynamic_action);',
'  END IF;',
'  --',
'  -- Set Defaults and Escape Input',
'  l_menu_label := apex_escape.html(l_menu_label);',
'  l_menu_icon  := apex_escape.html(l_menu_icon);',
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
'  l_result.attribute_07        := lower(l_hide_condition);',
'  l_result.attribute_08        := lower(l_disable_condition);',
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
,p_version_identifier=>'1.0.0'
,p_about_url=>'https://github.com/Dani3lSun/apex-plugin-extend_ig_menu'
,p_files_version=>19
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(23428761026913453)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
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
 p_id=>wwv_flow_api.id(23429145388913454)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
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
 p_id=>wwv_flow_api.id(23455614466492441)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
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
 p_id=>wwv_flow_api.id(23455935098493416)
,p_plugin_attribute_id=>wwv_flow_api.id(23455614466492441)
,p_display_sequence=>10
,p_display_value=>'Set Item Value'
,p_return_value=>'ITEM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(23456306700495407)
,p_plugin_attribute_id=>wwv_flow_api.id(23455614466492441)
,p_display_sequence=>20
,p_display_value=>'Trigger Custom Event'
,p_return_value=>'EVENT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(23430427652964044)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(23455614466492441)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Item which will get the Value of the Primary Key Column of Interactive Grid.<br>',
'After that you can react on the Change Event of the Item and can do things with that.<br>',
'Note: If you have multiple Primary Keys in the IG than an Array is returned. E.g. ["123456","654321"]'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(23457350788507571)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Custom Event'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(23455614466492441)
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
 p_id=>wwv_flow_api.id(23432129601020279)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
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
 p_id=>wwv_flow_api.id(23432463082020852)
,p_plugin_attribute_id=>wwv_flow_api.id(23432129601020279)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(23432895431021477)
,p_plugin_attribute_id=>wwv_flow_api.id(23432129601020279)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(23430793804966192)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Hide Condition'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_examples=>'"true" or "false" in Lower Case'
,p_help_text=>'Condition to Hide the Menu Entry. Item Substitution is supported: &P1_ITEM.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(23431005398968199)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Disable Condition'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'false'
,p_is_translatable=>false
,p_examples=>'"true" or "false" in Lower Case'
,p_help_text=>'Condition to Disable the Menu Entry. Item Substitution is supported: &P1_ITEM.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F20457874656E64204947204D656E750A2F2F20417574686F723A2044616E69656C20486F63686C6569746E65720A2F2F2056657273696F6E3A20312E302E300A0A2F2F20676C6F62616C206E616D6573706163650A76617220657874656E64477269';
wwv_flow_api.g_varchar2_table(2) := '644D656E75203D207B0A202020202F2F0A202020202F2F20706172736520737472696E6720746F20626F6F6C65616E0A202020207061727365426F6F6C65616E3A2066756E6374696F6E2870537472696E6729207B0A2020202020202020766172206C42';
wwv_flow_api.g_varchar2_table(3) := '6F6F6C65616E3B0A20202020202020206966202870537472696E672E746F4C6F776572436173652829203D3D2027747275652729207B0A2020202020202020202020206C426F6F6C65616E203D20747275653B0A20202020202020207D0A202020202020';
wwv_flow_api.g_varchar2_table(4) := '20206966202870537472696E672E746F4C6F776572436173652829203D3D202766616C73652729207B0A2020202020202020202020206C426F6F6C65616E203D2066616C73653B0A20202020202020207D0A202020202020202069662028212870537472';
wwv_flow_api.g_varchar2_table(5) := '696E672E746F4C6F776572436173652829203D3D202774727565272920262620212870537472696E672E746F4C6F776572436173652829203D3D202766616C7365272929207B0A2020202020202020202020206C426F6F6C65616E203D20756E64656669';
wwv_flow_api.g_varchar2_table(6) := '6E65643B0A20202020202020207D0A202020202020202072657475726E206C426F6F6C65616E3B0A202020207D2C0A202020202F2F0A202020202F2F20736574204772696420504B2056616C756520746F204974656D0A20202020736574506B4974656D';
wwv_flow_api.g_varchar2_table(7) := '56616C75653A2066756E6374696F6E2870526567696F6E49642C20704974656D29207B0A20202020202020202F2F20676574202F2073657420504B2056616C75650A2020202020202020766172206C526F7724203D202428272327202B2070526567696F';
wwv_flow_api.g_varchar2_table(8) := '6E4964202B20275F696727292E66696E6428272E6A732D6D656E75427574746F6E2E69732D61637469766527292E636C6F736573742827747227293B0A2020202020202020766172206C506B56616C7565203D206C526F77242E61747472282764617461';
wwv_flow_api.g_varchar2_table(9) := '2D696427293B0A2020202020202020247328704974656D2C206C506B56616C7565293B0A20202020202020202F2F204C6F6767696E670A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E736574506B49';
wwv_flow_api.g_varchar2_table(10) := '74656D56616C7565202D206C526F7724272C206C526F7724293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E736574506B4974656D56616C7565202D206C506B56616C7565272C206C506B56616C';
wwv_flow_api.g_varchar2_table(11) := '7565293B0A202020207D2C0A202020202F2F0A202020202F2F205472696767657220437573746F6D2041504558204576656E74207769746820504B2056616C75650A2020202074726967676572437573746F6D4576656E743A2066756E6374696F6E2870';
wwv_flow_api.g_varchar2_table(12) := '526567696F6E49642C20704576656E7429207B0A20202020202020202F2F2067657420504B2056616C75650A2020202020202020766172206C526F7724203D202428272327202B2070526567696F6E4964202B20275F696727292E66696E6428272E6A73';
wwv_flow_api.g_varchar2_table(13) := '2D6D656E75427574746F6E2E69732D61637469766527292E636C6F736573742827747227293B0A2020202020202020766172206C506B56616C7565203D206C526F77242E617474722827646174612D696427293B0A20202020202020202F2F2054726967';
wwv_flow_api.g_varchar2_table(14) := '6765722041504558204576656E740A2020202020202020617065782E6576656E742E7472696767657228272327202B2070526567696F6E49642C20704576656E742C206C506B56616C7565293B0A20202020202020202F2F204C6F6767696E670A202020';
wwv_flow_api.g_varchar2_table(15) := '2020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E74726967676572437573746F6D4576656E74202D206C526F7724272C206C526F7724293B0A2020202020202020617065782E64656275672E6C6F672827657874';
wwv_flow_api.g_varchar2_table(16) := '656E64477269644D656E752E74726967676572437573746F6D4576656E74202D206C506B56616C7565272C206C506B56616C7565293B0A202020207D2C0A202020202F2F0A202020202F2F204D656E7520416374696F6E2046756E6374696F6E0A202020';
wwv_flow_api.g_varchar2_table(17) := '206D656E75416374696F6E3A2066756E6374696F6E2870547970652C2070526567696F6E49642C20704974656D2C20704576656E7429207B0A20202020202020202F2F204C6F6767696E670A2020202020202020617065782E64656275672E6C6F672827';
wwv_flow_api.g_varchar2_table(18) := '657874656E64477269644D656E752E6D656E75416374696F6E202D207054797065272C207054797065293B0A0A2020202020202020696620287054797065203D3D20274954454D2729207B0A202020202020202020202020657874656E64477269644D65';
wwv_flow_api.g_varchar2_table(19) := '6E752E736574506B4974656D56616C75652870526567696F6E49642C20704974656D293B0A20202020202020207D20656C736520696620287054797065203D3D20274556454E542729207B0A202020202020202020202020657874656E64477269644D65';
wwv_flow_api.g_varchar2_table(20) := '6E752E74726967676572437573746F6D4576656E742870526567696F6E49642C20704576656E74293B0A20202020202020207D0A202020207D2C0A202020202F2F0A202020202F2F20616464206D656E75206974656D20746F204947206D656E750A2020';
wwv_flow_api.g_varchar2_table(21) := '2020616464477269644D656E75456E7472793A2066756E6374696F6E2870526567696F6E49642C20704D656E754F7074696F6E732C2070536570617261746F7229207B0A2020202020202020766172206C526567696F6E4964203D2070526567696F6E49';
wwv_flow_api.g_varchar2_table(22) := '643B0A20202020202020202F2F20526F7720616374696F6E73206D656E750A2020202020202020766172206C526F77416374696F6E4D656E7524203D202428222322202B206C526567696F6E4964202B20225F69675F726F775F616374696F6E735F6D65';
wwv_flow_api.g_varchar2_table(23) := '6E7522293B0A2020202020202020766172206C4D656E754974656D436F756E74203D206C526F77416374696F6E4D656E75242E646174612827617065782D6D656E7527292E6F7074696F6E732E6974656D732E6C656E6774683B0A20202020202020202F';
wwv_flow_api.g_varchar2_table(24) := '2F2072656E64657220736570617261746F720A20202020202020206966202870536570617261746F7229207B0A2020202020202020202020206C526F77416374696F6E4D656E75242E646174612827617065782D6D656E7527292E6F7074696F6E732E69';
wwv_flow_api.g_varchar2_table(25) := '74656D732E73706C696365286C4D656E754974656D436F756E742C20302C207B0A2020202020202020202020202020202069643A2027736570617261746F72272C0A20202020202020202020202020202020747970653A2022736570617261746F72222C';
wwv_flow_api.g_varchar2_table(26) := '0A20202020202020202020202020202020686964653A2066616C73652C0A2020202020202020202020202020202064697361626C65643A2066616C73650A2020202020202020202020207D293B0A2020202020202020202020206C4D656E754974656D43';
wwv_flow_api.g_varchar2_table(27) := '6F756E74203D206C4D656E754974656D436F756E74202B20313B0A20202020202020207D0A20202020202020202F2F20736574204944206F66206D656E7520656E7472790A2020202020202020704D656E754F7074696F6E732E6964203D202769672D6D';
wwv_flow_api.g_varchar2_table(28) := '656E752D6974656D2D27202B206C4D656E754974656D436F756E743B0A0A20202020202020202F2F204C6F6767696E670A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E616464477269644D656E7545';
wwv_flow_api.g_varchar2_table(29) := '6E747279202D206C526567696F6E4964272C206C526567696F6E4964293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E616464477269644D656E75456E747279202D206C526F77416374696F6E4D';
wwv_flow_api.g_varchar2_table(30) := '656E7524272C206C526F77416374696F6E4D656E7524293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E616464477269644D656E75456E747279202D206D656E754974656D436F756E74272C206C';
wwv_flow_api.g_varchar2_table(31) := '4D656E754974656D436F756E74293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E616464477269644D656E75456E747279202D20704D656E754F7074696F6E73272C20704D656E754F7074696F6E';
wwv_flow_api.g_varchar2_table(32) := '73293B0A20202020202020202F2F20616464206D656E7520656E7472790A20202020202020206C526F77416374696F6E4D656E75242E646174612827617065782D6D656E7527292E6F7074696F6E732E6974656D732E73706C696365286C4D656E754974';
wwv_flow_api.g_varchar2_table(33) := '656D436F756E74202B20312C20302C20704D656E754F7074696F6E73293B0A202020207D2C0A202020202F2F0A202020202F2F206D61696E2066756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0A2020202065';
wwv_flow_api.g_varchar2_table(34) := '7874656E644D656E753A2066756E6374696F6E2829207B0A20202020202020202F2F20706C7567696E20617474726962757465730A202020202020202076617220646154686973203D20746869733B0A2020202020202020766172207641666665637465';
wwv_flow_api.g_varchar2_table(35) := '64456C656D656E7473203D206461546869732E6166666563746564456C656D656E74733B0A202020202020202076617220764D656E754C6162656C203D206461546869732E616374696F6E2E61747472696275746530313B0A2020202020202020766172';
wwv_flow_api.g_varchar2_table(36) := '20764D656E7549636F6E203D206461546869732E616374696F6E2E61747472696275746530323B0A2020202020202020766172207652657475726E54797065203D206461546869732E616374696F6E2E61747472696275746530333B0A20202020202020';
wwv_flow_api.g_varchar2_table(37) := '207661722076506B4974656D203D206461546869732E616374696F6E2E61747472696275746530343B0A20202020202020207661722076437573746F6D4576656E74203D206461546869732E616374696F6E2E61747472696275746530353B0A20202020';
wwv_flow_api.g_varchar2_table(38) := '20202020766172207652656E646572536570617261746F72203D20657874656E64477269644D656E752E7061727365426F6F6C65616E286461546869732E616374696F6E2E6174747269627574653036293B0A2020202020202020766172207648696465';
wwv_flow_api.g_varchar2_table(39) := '436F6E646974696F6E203D20657874656E64477269644D656E752E7061727365426F6F6C65616E286461546869732E616374696F6E2E6174747269627574653037293B0A2020202020202020766172207644697361626C65436F6E646974696F6E203D20';
wwv_flow_api.g_varchar2_table(40) := '657874656E64477269644D656E752E7061727365426F6F6C65616E286461546869732E616374696F6E2E6174747269627574653038293B0A0A2020202020202020766172206C526567696F6E4964203D20764166666563746564456C656D656E74735B30';
wwv_flow_api.g_varchar2_table(41) := '5D2E69643B0A0A20202020202020202F2F204C6F6767696E670A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D20764166666563746564456C656D656E7473272C207641';
wwv_flow_api.g_varchar2_table(42) := '66666563746564456C656D656E7473293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D20764D656E754C6162656C272C20764D656E754C6162656C293B0A20202020';
wwv_flow_api.g_varchar2_table(43) := '20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D207652657475726E54797065272C207652657475726E54797065293B0A2020202020202020617065782E64656275672E6C6F672827';
wwv_flow_api.g_varchar2_table(44) := '657874656E64477269644D656E752E657874656E644D656E75202D20764D656E7549636F6E272C20764D656E7549636F6E293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E';
wwv_flow_api.g_varchar2_table(45) := '75202D2076506B4974656D272C2076506B4974656D293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D2076437573746F6D4576656E74272C2076437573746F6D4576';
wwv_flow_api.g_varchar2_table(46) := '656E74293B0A2020202020202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D207652656E646572536570617261746F72272C207652656E646572536570617261746F72293B0A20202020';
wwv_flow_api.g_varchar2_table(47) := '20202020617065782E64656275672E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D207648696465436F6E646974696F6E272C207648696465436F6E646974696F6E293B0A2020202020202020617065782E6465627567';
wwv_flow_api.g_varchar2_table(48) := '2E6C6F672827657874656E64477269644D656E752E657874656E644D656E75202D207644697361626C65436F6E646974696F6E272C207644697361626C65436F6E646974696F6E293B0A2020202020202020617065782E64656275672E6C6F6728276578';
wwv_flow_api.g_varchar2_table(49) := '74656E64477269644D656E752E657874656E644D656E75202D206C526567696F6E4964272C206C526567696F6E4964293B0A0A20202020202020202F2F206275696C64206D656E75206F7074696F6E73206F626A6563740A202020202020202076617220';
wwv_flow_api.g_varchar2_table(50) := '764D656E754F7074696F6E73203D207B0A20202020202020202020202069636F6E3A20764D656E7549636F6E2C0A20202020202020202020202069643A202769672D6D656E752D6974656D272C0A2020202020202020202020206C6162656C3A20764D65';
wwv_flow_api.g_varchar2_table(51) := '6E754C6162656C2C0A202020202020202020202020747970653A2022616374696F6E222C0A202020202020202020202020616374696F6E3A2066756E6374696F6E2829207B0A20202020202020202020202020202020657874656E64477269644D656E75';
wwv_flow_api.g_varchar2_table(52) := '2E6D656E75416374696F6E287652657475726E547970652C206C526567696F6E49642C2076506B4974656D2C2076437573746F6D4576656E74293B0A2020202020202020202020207D2C0A202020202020202020202020686964653A207648696465436F';
wwv_flow_api.g_varchar2_table(53) := '6E646974696F6E2C0A20202020202020202020202064697361626C65643A207644697361626C65436F6E646974696F6E0A20202020202020207D3B0A0A20202020202020202F2F20616464206D656E75206974656D0A2020202020202020657874656E64';
wwv_flow_api.g_varchar2_table(54) := '477269644D656E752E616464477269644D656E75456E747279286C526567696F6E49642C20764D656E754F7074696F6E732C207652656E646572536570617261746F72293B0A202020207D0A7D3B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(23433576488127752)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
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
wwv_flow_api.g_varchar2_table(3) := '75653A66756E6374696F6E28612C62297B76617220643D24282223222B612B225F696722292E66696E6428222E6A732D6D656E75427574746F6E2E69732D61637469766522292E636C6F736573742822747222292C633D642E617474722822646174612D';
wwv_flow_api.g_varchar2_table(4) := '696422293B247328622C63293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E736574506B4974656D56616C7565202D206C526F7724222C64293B617065782E64656275672E6C6F672822657874656E64477269644D656E';
wwv_flow_api.g_varchar2_table(5) := '752E736574506B4974656D56616C7565202D206C506B56616C7565222C63297D2C74726967676572437573746F6D4576656E743A66756E6374696F6E28612C62297B76617220643D24282223222B612B225F696722292E66696E6428222E6A732D6D656E';
wwv_flow_api.g_varchar2_table(6) := '75427574746F6E2E69732D61637469766522292E636C6F736573742822747222292C0A633D642E617474722822646174612D696422293B617065782E6576656E742E74726967676572282223222B612C622C63293B617065782E64656275672E6C6F6728';
wwv_flow_api.g_varchar2_table(7) := '22657874656E64477269644D656E752E74726967676572437573746F6D4576656E74202D206C526F7724222C64293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E74726967676572437573746F6D4576656E74202D206C';
wwv_flow_api.g_varchar2_table(8) := '506B56616C7565222C63297D2C6D656E75416374696F6E3A66756E6374696F6E28612C622C642C63297B617065782E64656275672E6C6F672822657874656E64477269644D656E752E6D656E75416374696F6E202D207054797065222C61293B22495445';
wwv_flow_api.g_varchar2_table(9) := '4D223D3D613F657874656E64477269644D656E752E736574506B4974656D56616C756528622C64293A224556454E54223D3D612626657874656E64477269644D656E752E74726967676572437573746F6D4576656E7428622C63297D2C61646447726964';
wwv_flow_api.g_varchar2_table(10) := '4D656E75456E7472793A66756E6374696F6E28612C622C64297B76617220633D24282223222B612B225F69675F726F775F616374696F6E735F6D656E7522292C653D632E646174612822617065782D6D656E7522292E6F7074696F6E732E6974656D732E';
wwv_flow_api.g_varchar2_table(11) := '6C656E6774683B64262628632E646174612822617065782D6D656E7522292E6F7074696F6E732E6974656D732E73706C69636528652C0A302C7B69643A22736570617261746F72222C747970653A22736570617261746F72222C686964653A21312C6469';
wwv_flow_api.g_varchar2_table(12) := '7361626C65643A21317D292C652B3D31293B622E69643D2269672D6D656E752D6974656D2D222B653B617065782E64656275672E6C6F672822657874656E64477269644D656E752E616464477269644D656E75456E747279202D206C526567696F6E4964';
wwv_flow_api.g_varchar2_table(13) := '222C61293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E616464477269644D656E75456E747279202D206C526F77416374696F6E4D656E7524222C63293B617065782E64656275672E6C6F672822657874656E64477269';
wwv_flow_api.g_varchar2_table(14) := '644D656E752E616464477269644D656E75456E747279202D206D656E754974656D436F756E74222C65293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E616464477269644D656E75456E747279202D20704D656E754F70';
wwv_flow_api.g_varchar2_table(15) := '74696F6E73222C62293B632E646174612822617065782D6D656E7522292E6F7074696F6E732E6974656D732E73706C69636528652B312C302C62297D2C657874656E644D656E753A66756E6374696F6E28297B76617220613D746869732E616666656374';
wwv_flow_api.g_varchar2_table(16) := '6564456C656D656E74732C623D746869732E616374696F6E2E61747472696275746530312C643D746869732E616374696F6E2E61747472696275746530322C0A633D746869732E616374696F6E2E61747472696275746530332C653D746869732E616374';
wwv_flow_api.g_varchar2_table(17) := '696F6E2E61747472696275746530342C673D746869732E616374696F6E2E61747472696275746530352C683D657874656E64477269644D656E752E7061727365426F6F6C65616E28746869732E616374696F6E2E6174747269627574653036292C6B3D65';
wwv_flow_api.g_varchar2_table(18) := '7874656E64477269644D656E752E7061727365426F6F6C65616E28746869732E616374696F6E2E6174747269627574653037292C6C3D657874656E64477269644D656E752E7061727365426F6F6C65616E28746869732E616374696F6E2E617474726962';
wwv_flow_api.g_varchar2_table(19) := '7574653038292C663D615B305D2E69643B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D20764166666563746564456C656D656E7473222C61293B617065782E64656275672E6C6F67282265';
wwv_flow_api.g_varchar2_table(20) := '7874656E64477269644D656E752E657874656E644D656E75202D20764D656E754C6162656C222C62293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D207652657475726E54797065222C63';
wwv_flow_api.g_varchar2_table(21) := '293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D20764D656E7549636F6E222C64293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E';
wwv_flow_api.g_varchar2_table(22) := '75202D2076506B4974656D222C0A65293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D2076437573746F6D4576656E74222C67293B617065782E64656275672E6C6F672822657874656E64';
wwv_flow_api.g_varchar2_table(23) := '477269644D656E752E657874656E644D656E75202D207652656E646572536570617261746F72222C68293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D207648696465436F6E646974696F';
wwv_flow_api.g_varchar2_table(24) := '6E222C6B293B617065782E64656275672E6C6F672822657874656E64477269644D656E752E657874656E644D656E75202D207644697361626C65436F6E646974696F6E222C6C293B617065782E64656275672E6C6F672822657874656E64477269644D65';
wwv_flow_api.g_varchar2_table(25) := '6E752E657874656E644D656E75202D206C526567696F6E4964222C66293B657874656E64477269644D656E752E616464477269644D656E75456E74727928662C7B69636F6E3A642C69643A2269672D6D656E752D6974656D222C6C6162656C3A622C7479';
wwv_flow_api.g_varchar2_table(26) := '70653A22616374696F6E222C616374696F6E3A66756E6374696F6E28297B657874656E64477269644D656E752E6D656E75416374696F6E28632C662C652C67297D2C686964653A6B2C64697361626C65643A6C7D2C68297D7D3B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(23433886807127780)
,p_plugin_id=>wwv_flow_api.id(23428581641913451)
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
