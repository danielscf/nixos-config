{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    keyMode = "vi";
    prefix = "C-a";
    escapeTime = 0;
    mouse = true;
    #shell = "${pkgs.nushell}";
    terminal = "tmux-256color";
    disableConfirmationPrompt = true;

    extraConfig = ''
      set -g set-clipboard on
      set -g renumber-windows on
      set -g status-position bottom
      set -g status-left-length 50
      set -g detach-on-destroy on
      set -g allow-passthrough on

      unbind %
      unbind '"'
      unbind t
      unbind w
      unbind x
      unbind o
      unbind s
      unbind -
      unbind 0

      bind x kill-pane
      bind t set-option status
      bind r source-file ~/.config/tmux/tmux.conf
      #bind w run-shell -b "~/.config/tmux/plugins/tmux-fzf/scripts/session.sh switch && ~/scripts/tmux-previous-session"
      #bind o display-popup -BEh 30% "~/scripts/tmux-workplace --window"

      #bind s display-popup -BEh 30% "~/scripts/tmux-workplace"
      #bind ` run-shell -b "tmux switch-client -t $(cat ~/.tmux/tmux-previous-session)"
      #bind 0 run-shell -b "tmux switch-client -t 'personal-notes'"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind b split-window -v -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"

      bind -n M-H previous-window
      bind -n M-L next-window

      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy && wl-paste -n | wl-copy -p"
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key p run "wl-paste -n | tmux load-buffer - ; tmux paste-buffer"
    '';

    plugins = with pkgs; [
      tmuxPlugins.open
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-save-shell-history 'off'
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-processes 'ssh ncspot cmus'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-boot 'on'
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5'
        '';
      }
      {
        plugin = tmuxPlugins.tmux-fzf;
      }
      {
        plugin = tmuxPlugins.tmux-nova;
        extraConfig = ''
          color1="#${config.lib.stylix.colors.base01}"
          color2="#${config.lib.stylix.colors.base02}"
          color3="#${config.lib.stylix.colors.base03}"
          color4="#${config.lib.stylix.colors.base04}"
          color5="#${config.lib.stylix.colors.base05}"
          color6="#${config.lib.stylix.colors.base06}"
          color7="#${config.lib.stylix.colors.base07}"
          color8="#${config.lib.stylix.colors.base08}"

          color9="#${config.lib.stylix.colors.base09}"
          color10="#${config.lib.stylix.colors.base10}"
          color11="#${config.lib.stylix.colors.base11}"
          color12="#${config.lib.stylix.colors.base12}"
          color13="#${config.lib.stylix.colors.base13}"
          color14="#${config.lib.stylix.colors.base14}"
          color15="#${config.lib.stylix.colors.base15}"
          color16="#${config.lib.stylix.colors.base16}"

          background="#${config.lib.stylix.colors.base00}"
          foreground="#${config.lib.stylix.colors.base06}"

          seg_a="$background $foreground"
          seg_b="$color9 $foreground"

          set -gw window-status-current-style bold

          set -g @nova-pane "#I #W#{?window_zoomed_flag, 󰍉,}#{?window_active, *,}"
          set -g @nova-pane-justify "absolute-centre"

          set -g "@nova-status-style-bg" "$background"
          set -g "@nova-status-style-fg" "$foreground"
          set -g "@nova-status-style-active-bg" "$background"
          set -g "@nova-status-style-active-fg" "$foreground"

          set -g "@nova-mode-style-bg" "$background"
          set -g "@nova-mode-style-fg" "$foreground"
          set -g "@nova-message-style-bg" "$background"
          set -g "@nova-message-style-fg" "$foreground"
          set -g "@nova-message-command-style-bg" "$background"
          set -g "@nova-message-command-style-fg" "$foreground"

          set -g @nova-segment-mode "#{?client_prefix, 󱓻 , 󱓼 }"
          set -g @nova-segment-mode-colors "$seg_b"

          set -g @nova-segment-session "#{session_name} "
          set -g @nova-segment-session-colors "$seg_a"

          set -g @nova-segments-0-left "mode session"
          set -g @nova-segments-0-right ""
        '';
      }
    ];
  };
}
