/*-------------------------------------
 * Extend IG Menu functions
 * Version: 1.1.3 (15.01.2018)
 * Author:  Daniel Hochleitner
 *-------------------------------------
*/
FUNCTION render_extend_ig_menu(p_dynamic_action IN apex_plugin.t_dynamic_action,
                               p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  -- plugin attributes
  l_result                   apex_plugin.t_dynamic_action_render_result;
  l_menu_label               p_dynamic_action.attribute_01%TYPE := p_dynamic_action.attribute_01;
  l_menu_icon                p_dynamic_action.attribute_02%TYPE := p_dynamic_action.attribute_02;
  l_return_type              p_dynamic_action.attribute_03%TYPE := p_dynamic_action.attribute_03;
  l_pk_item                  p_dynamic_action.attribute_04%TYPE := p_dynamic_action.attribute_04;
  l_custom_event             p_dynamic_action.attribute_05%TYPE := p_dynamic_action.attribute_05;
  l_render_separator         p_dynamic_action.attribute_06%TYPE := p_dynamic_action.attribute_06;
  l_hide_condition           p_dynamic_action.attribute_07%TYPE := p_dynamic_action.attribute_07;
  l_hide_condition_type      p_dynamic_action.attribute_09%TYPE := p_dynamic_action.attribute_09;
  l_hide_condition_column    p_dynamic_action.attribute_10%TYPE := p_dynamic_action.attribute_10;
  l_disable_condition        p_dynamic_action.attribute_08%TYPE := p_dynamic_action.attribute_08;
  l_disable_condition_type   p_dynamic_action.attribute_11%TYPE := p_dynamic_action.attribute_11;
  l_disable_condition_column p_dynamic_action.attribute_12%TYPE := p_dynamic_action.attribute_12;
  --
BEGIN
  -- Debug
  IF apex_application.g_debug THEN
    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,
                                          p_dynamic_action => p_dynamic_action);
  END IF;
  --
  -- Set Defaults and Escape Input
  l_menu_label               := apex_escape.html(l_menu_label);
  l_menu_icon                := apex_escape.html(l_menu_icon);
  l_hide_condition_column    := apex_escape.html(l_hide_condition_column);
  l_disable_condition_column := apex_escape.html(l_disable_condition_column);
  --
  IF lower(l_hide_condition) NOT IN
     ('true',
      'false') THEN
    l_hide_condition := 'false';
  END IF;
  IF lower(l_disable_condition) NOT IN
     ('true',
      'false') THEN
    l_disable_condition := 'false';
  END IF;
  --
  --
  l_result.javascript_function := 'extendGridMenu.extendMenu';
  l_result.attribute_01        := l_menu_label;
  l_result.attribute_02        := l_menu_icon;
  l_result.attribute_03        := l_return_type;
  l_result.attribute_04        := upper(l_pk_item);
  l_result.attribute_05        := l_custom_event;
  l_result.attribute_06        := l_render_separator;
  l_result.attribute_07        := lower(nvl(l_hide_condition,
                                            'false'));
  l_result.attribute_08        := lower(nvl(l_disable_condition,
                                            'false'));
  l_result.attribute_09        := l_hide_condition_type;
  l_result.attribute_10        := upper(l_hide_condition_column);
  l_result.attribute_11        := l_disable_condition_type;
  l_result.attribute_12        := upper(l_disable_condition_column);
  --
  RETURN l_result;
  --
END render_extend_ig_menu;
