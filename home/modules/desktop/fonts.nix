{
  pkgs,
  lib,
  ...
}:

let
  fontPackages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.zed-mono
    nerd-fonts.victor-mono
    nerd-fonts.monaspace
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.recursive-mono
    nerd-fonts.blex-mono
    nerd-fonts._0xproto
    font-awesome
    powerline-fonts
    corefonts
    roboto-serif
    source-serif-pro
    roboto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji-blob-bin
  ];

  fontPathString = pkgs.lib.concatStringsSep " " (map (p: "${p}") fontPackages);
in

{
  fonts.fontconfig.enable = true;

  home.packages = fontPackages;

  home.activation.copyUserFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''

    FONT_DEST="$HOME/.local/share/fonts/nix-managed"

    echo
    echo "Copying fonts into ~/.local/share/fonts"
    echo

    rm -rf "$FONT_DEST"
    mkdir -p "$FONT_DEST"

    for FONT_PKG_PATH in ${fontPathString}; do
        FONT_SRC_DIR="$FONT_PKG_PATH/share/fonts"
        if [ -d "$FONT_SRC_DIR" ]; then
            echo "  -> Copying from $FONT_SRC_DIR"
            find "$FONT_SRC_DIR" -type f \( -name "*.otf" -o -name "*.ttf" \) -exec cp {} "$FONT_DEST" \;
        else
            # Some packages might put fonts in the root of the store path.
            echo "  -> (share/fonts not found, trying root) Copying from $FONT_PKG_PATH"
            find "$FONT_PKG_PATH" -maxdepth 1 -type f \( -name "*.otf" -o -name "*.ttf" \) -exec cp {} "$FONT_DEST" \;
        fi
    done

    echo
    echo "Don't forget to rebuild the font cache!"
    echo
  '';
}
