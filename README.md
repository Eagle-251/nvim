# Neovim Wrapped in Nix

Inspired by https://ayats.org/blog/neovim-wrapper and frustrated by nixvim (despite the fact that it is a very good project) I wanted a simple, lightweight way to configure neovim in Nix. This is my attempt.
I used https://github.com/LunarVim/Neovim-from-scratch as a base for the lua. I throughly recommend checking that out for some nice ideas about how to set things up.


## Running

You should be able to run:
```shell
nix run github:Eagle-251/neovim-nixos-wrapper
```

There are still some loose ends, mainly the terminal wrappers toggleterm.lua. You will need to have thowse tools on your path to use those wrappers.
