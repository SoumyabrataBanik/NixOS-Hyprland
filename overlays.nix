{ zen-browser, open-webui, ... }:

(final: prev: {

    # Zen-browser Overlay
    zen-browser = zen-browser.packages.${prev.system}.zen-browser;

    # Open WebUI Overlay
    open-webui = open-webui.packages.${prev.system}.default;
})
