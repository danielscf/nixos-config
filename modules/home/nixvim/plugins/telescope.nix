{
  programs.nixvim.plugins.telescope = {
    enable = true;

    extensions = {
      media-files.enable = true;

      fzf-native = {
        enable = true;
        settings = {
          fuzzy = true;
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
      };
    };

    keymaps = {
      "<leader>sf" = {
        action = "find_files";
        options.desc = "Telescope File Search";
      };
      "<leader>ss" = {
        action = "live_grep";
        options.desc = "Telescope String Search";
      };
      "<leader>sm" = {
        action = "marks";
        options.desc = "Telescope Marks Search";
      };
      "<leader>sr" = {
        action = "registers";
        options.desc = "Telescope Registers Search";
      };
    };

    settings.defaults = {
      sorting_strategy = "ascending";
      layout_strategy = "horizontal";

      prompt_prefix = "   ";
      selection_caret = "  ";
      entry_prefix = "  ";
      set_env.colorterm = "truecolor";
      color_devicons.enable = true;

      layout_config = {
        horizontal.prompt_position = "top";
        vertical.mirror = false;
      };

      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
      ];
    };
  };
}
