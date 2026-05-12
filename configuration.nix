# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ codex-nix, pkgs, ... }:

{
  wsl.enable = true;
  wsl.useWindowsDriver = true;
  wsl.defaultUser = "ramon";

  users.users.ramon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  environment.sessionVariables = {
    LD_LIBRARY_PATH = "/usr/lib/wsl/lib";
  };

  environment.systemPackages = with pkgs; [
    codex-nix.packages.${pkgs.system}.default
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ramon = import ./home.nix;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations, database versions
  # and so on were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
