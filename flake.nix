{
  description = "Personal neovim wrapper";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      nvim = pkgs.callPackage ./neovim.nix {};
    in {
      # checks = {
      #   # Run `nix flake check .` to verify that your config is not broken
      #   default = nixvimLib.check.mkTestDerivationFromNvim {
      #     inherit nvim;
      #     name = "A nixvim configuration";
      #   };
      # };

      packages = {
        # Lets you run `nix run .` to start nixvim
        default = nvim;
      };
    });
}
