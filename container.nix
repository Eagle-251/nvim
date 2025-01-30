{ pkgs, neovim, ... }:

pkgs.dockerTools.buildLayeredImage {
  name = "neovim_wrapped";
  contents = [ neovim ];
}
