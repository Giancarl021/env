{
  description = "Giancarl021's Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim.url = "github:neovim/neovim/stable?dir=contrib";
    neovim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, neovim }: {
    packages.x86_64-linux.default = neovim.packages.x86_64-linux.neovim;
    apps.x86_64-linux.default = {
        type = "app";
        program = "${neovim.packages.x86_64-linux.neovim}/bin/nvim";
    };
  };
}