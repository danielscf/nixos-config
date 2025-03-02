{
  programs.nixvim.plugins.lint = {
    enable = true;
    autoLoad = true;

    lintersByFt = {
      javascript = ["eslint_d"];
      typescript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      typescriptreact = ["eslint_d"];
      svelte = ["eslint_d"];

      sh = ["shellcheck"];
      bash = ["shellcheck"];

      python = ["ruff"];
      htmldjango = ["djlint"];

      lua = ["selene"];
    };
  };
}
