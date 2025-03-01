{
  programs.nixvim.plugins.treesiter = {
    enable = true;
    autoLoad = true;
    folding = true;

    highlight.enable = true;
    indent.enable = true;

    incremental_selection = {
      enable = true;
      keymaps = {
	init_selection = "<C-space>";
	node_decremental = "<C-space>";
	node_incremental = "<bs>";
	scope_incremental = false;
      };
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      astro
      bash
      c
      c_sharp
      cmake
      cpp
      css
      dart
      diff
      dockerfile
      elixir
      fish
      gitignore
      go
      godot_resource
      gomod
      gosum
      gowork
      gpg
      graphql
      groovy
      haskell
      haskell_persistent
      hjson
      html
      htmldjango
      http
      hyprlang
      java
      javascript
      jsdoc
      json
      json5
      jsonc
      kdl
      kotlin
      lua
      luadoc
      luap
      make
      markdown
      markdown-inline
      nix
      ocaml
      ocaml_interface
      perl
      php
      phpdoc
      prisma
      python
      query
      rasi
      regex
      ruby
      rust
      scala
      sql
      svelte
      terraform
      toml
      tsx
      typescript
      vim
      vue
      vimdoc
      xml
      yaml
    ];
  };
}
