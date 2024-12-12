{
  callPackage,
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  lib,
  lua-language-server,
  ansible-language-server,
  ansible-lint,
  ansible,
  nil,
  lazygit,
  yazi,
}: let
  packageName = "neovim-conf";

  ansible-doc-nvim = callPackage ./ansible-doc.nix {};

  startPlugins = with vimPlugins; [
    lz-n
    nvim-lspconfig
    catppuccin-nvim
    lualine-nvim
    gitsigns-nvim
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp_luasnip
    nvim-cmp
    (nvim-treesitter.withPlugins (plugins: with plugins; [
      nix
      lua
      yaml
      toml
      python
      rust
      groovy
    ]))
    # nvim-autopairs
  ];
  
  optPlugins = with vimPlugins; [
    telescope-nvim
    toggleterm-nvim
    luasnip
    friendly-snippets
    nvim-autopairs
    yazi-nvim
    nvim-surround
    lazygit-nvim
    ansible-doc-nvim
  ];

  extraPackages = [
    lua-language-server
    ansible-language-server
    ansible
    ansible-lint
    nil
    lazygit
    yazi
  ];

  foldPlugins = builtins.foldl' (
    acc: next:
      acc
      ++ [
        next
      ]
      ++ (foldPlugins (next.dependencies or []))
  ) [];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);
  optPluginsWithDeps = lib.unique (foldPlugins optPlugins);

  packpath = runCommandLocal "packpath" {} ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ln -vsfT ${./nvim-conf} $out/pack/${packageName}/start/nvim-conf

    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPluginsWithDeps
    }
    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/opt/${lib.getName plugin}")
      optPluginsWithDeps
    }
  '';

in
  symlinkJoin {
    name = "nvim";
    paths = [neovim-unwrapped];
    nativeBuildInputs = [makeWrapper];
    buildInputs = extraPackages;
    postBuild = ''
      wrapProgram $out/bin/nvim \
        --add-flags '-u NORC' \
        --add-flags '--cmd' \
        --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
        --set-default NVIM_APPNAME nvim-custom \
        --prefix PATH : ${lib.makeBinPath extraPackages}
    '';

    passthru = {
      inherit packpath;
    };
  }


  
  
  

  
  
