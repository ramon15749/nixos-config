# NixOS WSL Configuration

Personal NixOS WSL and Home Manager configuration for `ramon`.

## Apply

```sh
sudo nixos-rebuild switch --flake .#nixos
```

## Files

- `flake.nix` pins NixOS, NixOS-WSL, Home Manager, and Codex inputs.
- `configuration.nix` contains system-level NixOS/WSL settings.
- `home.nix` contains user-level Home Manager settings.
