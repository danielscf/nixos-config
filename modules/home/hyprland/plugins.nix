{
  wayland.windowManager.hyprland.settings.plugin = {
    hy3 = {
      no_gaps_when_only = 0;
      node_collapse_policy = 2;
      group_inset = 10;
      tab_first_window = true;

      tabs = {
        height = 0;
        padding = 0;
        from_top = false;
        rounding = 0;
        render_text = false;
        "col.active" = "rgba(194,145,119,1.0)";
        "col.urgent" = "0xffff4f4f";
        "col.inactive" = "rgba(66,66,66,1.0)";
      };

      autotile = {
        enable = false;
        ephemeral_groups = true;
        trigger_width = 800;
        trigger_height = 500;
        workspaces = "all";
      };
    };
  };
}
