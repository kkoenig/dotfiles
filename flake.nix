{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    packages.aarch64-darwin.default = home-manager.defaultPackage.aarch64-darwin;
    packages.x86_64-darwin.default = home-manager.defaultPackage.x86_64-darwin;
    homeConfigurations = {
      "kkoenig" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        modules = [
          ./home.nix
          ./home/alacritty.nix
          ./home/bash.nix
          ./home/fzf.nix
          ./home/git.nix
          ./home/neovim.nix
          ./home/starship.nix
        ];
      };
    };
  };
}
