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
    shell = "${pkgs.nushell}";
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
    ];
  };
}
