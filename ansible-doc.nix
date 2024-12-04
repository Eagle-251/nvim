{ 
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
    name = "ansible-doc.nvim";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "ansible-doc.nvim";
      rev = "02e2b0b3d00723765524c079ffc7bf75f7c55fd3";
      hash = "sha256-SHQ6VTG+qLtEVTHQGIHt0+P5ZxDLdFgF/KEbQCglD4A="; # fill with correct hash
    };
}
