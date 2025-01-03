{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }: {
    packages.aarch64-darwin.default = home-manager.defaultPackage.aarch64-darwin;
    packages.x86_64-darwin.default = home-manager.defaultPackage.x86_64-darwin;
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
    homeConfigurations = {
      "kkoenig" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        modules = [
          catppuccin.homeManagerModules.catppuccin
          ./home.nix
          ./home/bash.nix
          ./home/fzf.nix
          ./home/git.nix
          ./home/neovim/default.nix
          ./home/tmux.nix
        ];
      };
    };
  };
}
