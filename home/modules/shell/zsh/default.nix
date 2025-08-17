{ ... }:
let
  myAliases = {
    c = "clear";

    l = "eza -lh  --icons=auto";
    ls = "eza -1   --icons=auto";
    ll = "eza -lha --icons=auto --sort=name --group-directories-first";
    ld = "eza -lhD --icons=auto";
    lt = "eza --icons=auto --tree";

    mkdir = "mkdir -p";

    # System Upgrade
    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    homeRebuild = "home-manager switch --flake ~/.dotfiles -b backup";
    fullRebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles && home-manager switch --flake ~/.dotfiles -b backup";

    # Tmuxifier Aliases
    t = "tmuxifier";
    tes = "tmuxifier es";
    ts = "tmuxifier s";
    tns = "tmuxifier ns";
    tls = "tmuxifier ls";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
      };
      shellAliases = myAliases;
    };
  };
}
