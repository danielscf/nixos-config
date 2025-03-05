{
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      {
        key = ";";
        action = ":";
        options.nowait = true;
      }

      # Clear search
      {
        key = "<Esc>";
        action = "<cmd>noh<cr><Esc>";
        mode = [
          "i"
          "n"
          "v"
        ];
      }

      # Move between windows
      {
        key = "<C-h>";
        action = "<C-w>h";
        mode = [ "n" ];
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
        mode = [ "n" ];
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
        mode = [ "n" ];
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
        mode = [ "n" ];
      }

      # Move at the beginning or end of a line
      {
        key = "H";
        action = "^";
        mode = [
          "n"
          "v"
        ];
      }
      {
        key = "L";
        action = "$";
        mode = [
          "n"
          "v"
        ];
      }

      # Maintain indenting
      {
        key = "<";
        action = "<gv";
        mode = [ "v" ];
      }
      {
        key = ">";
        action = ">gv";
        mode = [ "v" ];
      }

      # Move lines
      {
        key = "<A-j>";
        action = "<cmd>m .+1<cr>==";
        mode = [ "n" ];
      }
      {
        key = "<A-k>";
        action = "<cmd>m .-2<cr>==";
        mode = [ "n" ];
      }
      {
        key = "<A-j>";
        action = "<esc><cmd>m .+1<cr>==gi";
        mode = [ "i" ];
      }
      {
        key = "<A-k>";
        action = "<esc><cmd>m .-2<cr>==gi";
        mode = [ "i" ];
      }
      {
        key = "<A-j>";
        action = ":m '>+1<cr>gv=gv";
        mode = [ "v" ];
      }
      {
        key = "<A-k>";
        action = ":m '<-2<cr>gv=gv";
        mode = [ "v" ];
      }

      # Move up/down on multi line
      {
        key = "j";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
        };
        mode = [
          "n"
          "x"
        ];
      }
      {
        key = "<Down>";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
        };
        mode = [
          "n"
          "x"
        ];
      }
      {
        key = "k";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
        };
        mode = [
          "n"
          "x"
        ];
      }
      {
        key = "<Up>";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
        };
        mode = [
          "n"
          "x"
        ];
      }

      # Split buffer
      {
        key = "<leader>bv";
        action = "<C-w>v";
        mode = [ "n" ];
        options.desc = "Split window vertically";
      }
      {
        key = "<leader>bh";
        action = "<C-w>s";
        mode = [ "n" ];
        options.desc = "Split window horizontally";
      }

      # Re-size buffers
      {
        key = "<M-,>";
        action = "<C-w>5<";
        mode = [ "n" ];
        options.desc = "Expand split to the left";
      }
      {
        key = "<M-.>";
        action = "<C-w>5>";
        mode = [ "n" ];
        options.desc = "Expand split to the right";
      }
      {
        key = "<M-t>";
        action = "<C-w>+";
        mode = [ "n" ];
        options.desc = "Expand split upwards";
      }
      {
        key = "<M-s>";
        action = "<C-w>-";
        mode = [ "n" ];
        options.desc = "Expand split downwards";
      }

      # Swap spelling language
      {
        key = "<leader>le";
        action = "<cmd>set spelllang=en_us<cr>";
        mode = [ "n" ];
        options.desc = "English spell check";
      }
      {
        key = "<leader>ls";
        action = "<cmd>set spelllang=es<cr>";
        mode = [ "n" ];
        options.desc = "Spanish spell check";
      }

      # Close buffer
      {
        key = "<leader>x";
        action = "<cmd>bd<cr>";
        mode = [ "n" ];
        options.desc = "Close buffer";
      }

      # Add blank lines
      {
        key = "<CR>";
        action = "m`o<Esc>``";
        mode = [ "n" ];
      }
      {
        key = "<A-CR>";
        action = "m`O<Esc>``";
        mode = [ "n" ];
      }

      # Open the current file
      {
        key = "<leader>fx";
        action = ''
          function()
              vim.ui.open(vim.api.nvim_buf_get_name(0))
          end
        '';
        mode = [ "n" ];
        options.desc = "Open file";
      }

      # TODO: Navigate through tabs?
    ];
  };
}
