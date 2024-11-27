{
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  lib,
  lua-language-server,
  ansible-language-server,
  ansible-lint,
  ansible
}: let
  packageName = "neovim-conf";

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
    luasnip
    friendly-snippets
    nvim-treesitter.withAllGrammars
  ];
  
  optPlugins = with vimPlugins; [
    telescope-nvim
    toggleterm-nvim
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp_luasnip
    nvim-cmp
    luasnip
    friendly-snippets
  ];

  extraPackages = [
    lua-language-server
    ansible-language-server
    ansible
    ansible-lint
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
    name = "neovim-custom";
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


  
  
  

  
  
