{ pkgs-unstable, ... }:

{
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs-unstable.vimPlugins; [
      barbar-nvim
      gitsigns-nvim
      nvim-web-devicons
      nvim-colorizer-lua
      dracula-nvim
      fugitive-gitlab-vim
      hover-nvim
      kulala-nvim
      nvim-lspconfig
      fidget-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      nvim-jdtls
      conform-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-smart-history-nvim
      telescope-ui-select-nvim
      markdown-nvim
      render-markdown-nvim
      nvim-ts-autotag
      undotree
      lualine-nvim
      nvim-treesitter.withAllGrammars
      trouble-nvim
    ];

    extraPackages = with pkgs-unstable; [
      # LSPs
      lua-language-server
      typescript-language-server
      gopls
      jdt-language-server
      clang-tools
      gcc
      zig
      vscode-langservers-extracted
      tailwindcss-language-server
      eslint
      bash-language-server
      #python313Packages.python-lsp-server
      pyright
      marksman
      emmet-ls
      nil

      # Formatters and Linters
      luajitPackages.luacheck
      luajitPackages.luarocks
      gofumpt
      gotools
      black
      nixfmt
      stylua
      prettier
      yamlfmt
      sql-formatter
      kulala-fmt

      # For Telescope
      fd
      ripgrep
      cmake
      pkg-config

      # For kulala
      grpcurl
      websocat
      openssl
    ];
  };
}
