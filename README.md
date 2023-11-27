Local:
```bash
nix run . -- switch --flake .
```

### Installation on MacOS

1. Install [Nix](https://nix.dev/install-nix)
   ```bash
   curl -L https://nixos.org/nix/install | sh
   ```
2. Enable [flakes](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake) and [nix-command](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix)
   ```bash
   mkdir -p $HOME/.config/nix/ && echo "experimental-features = flakes nix-command" >> $HOME/.config/nix/nix.conf
   ```
3. Install home-manager (todo)
4. Build and activate this configuration
   ```bash
   home-manager switch --flake github:kkoenig/dotfiles2
   ```
