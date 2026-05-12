{
  description = "Ramon's NixOS WSL system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    codex-nix.url = "github:SecBear/codex-nix";
  };

  outputs = inputs@{ nixpkgs, nixos-wsl, home-manager, codex-nix, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs codex-nix; };
      modules = [
        nixos-wsl.nixosModules.default
        home-manager.nixosModules.home-manager
        ./configuration.nix
      ];
    };
  };
}
