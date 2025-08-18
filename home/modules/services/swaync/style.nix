{ config, ... }:
let
  palette = config.theme.palette;
in
{
  services.swaync.style = ''
    * {
        all: unset;
        font-family: FiraCode Nerd Font;
        transition: 0.3s;
        font-size: 1rem;
    }

    .floating-notifications.background .notification-row {
        padding: 1rem;
    }

    .floating-notifications.background .notification-row .notification-background {
        border-radius: 0.5rem;
        background-color: #${palette.background};
        color: #${palette.foreground};
        border: 1px solid #${palette.color12};
    }

    .floating-notifications.background .notification-row .notification-background .notification {
        padding: 0.5rem;
        border-radius: 0.5rem;
    }

    .floating-notifications.background .notification-row .notification-background .notification.critical {
        border: 1px solid #${palette.color9};
    }

    .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
        margin: 0.5rem;
        color: #${palette.foreground};
        font-weight: bold;
    }

    .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
        margin: 0.5rem;
        color: #${palette.color8};
    }

    .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* {
        min-height: 3rem;
    }

    .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action {
        border-radius: 0.5rem;
        color: #${palette.foreground};
        background-color: #${palette.background};
        border: 1px solid #${palette.color12};
    }

    .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
        background-color: #${palette.background};
    }

    .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
        background-color: #${palette.cursor};
    }

    .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 0.5rem;
        padding: 0.25rem;
        border-radius: 0.5rem;
        color: #${palette.foreground};
        background-color: #${palette.color1};
    }

    .floating-notifications.background .notification-row .notification-background .close-button:hover {
        color: #${palette.color0};
    }

    .floating-notifications.background .notification-row .notification-background .close-button:active {
        background-color: #ebbcba;
    }

    .control-center {
        border-radius: 0.5rem;
        margin: 1rem;
        background-color: #${palette.background};
        color: #${palette.foreground};
        padding: 1rem;
        border: 1px solid #${palette.color12};
    }

    .control-center .widget-title {
        color: #${palette.foreground};
        font-weight: bold;
    }

    .control-center .widget-title button {
        border-radius: 0.5rem;
        color: #${palette.foreground};
        background-color: #${palette.background};
        border: 1px solid #${palette.color12};
        padding: 0.5rem;
    }

    .control-center .widget-title button:hover {
        background-color: #${palette.background};
    }

    .control-center .widget-title button:active {
        background-color: #${palette.background};
    }

    .control-center .notification-row .notification-background {
        border-radius: 0.5rem;
        margin: 0.5rem 0;
        background-color: #${palette.background};
        color: #${palette.foreground};
        border: 1px solid #${palette.color12};
    }

    .control-center .notification-row .notification-background .notification {
        padding: 0.5rem;
        border-radius: 0.5rem;
    }

    .control-center .notification-row .notification-background .notification.critical {
        border: 1px solid #eb6f92;
    }

    .control-center .notification-row .notification-background .notification .notification-content {
        color: #${palette.foreground};
    }

    .control-center .notification-row .notification-background .notification .notification-content .summary {
        margin: 0.5rem;
        color: #${palette.foreground};
        font-weight: bold;
    }

    .control-center .notification-row .notification-background .notification .notification-content .body {
        margin: 0.5rem;
        color: #${palette.foreground};
    }

    .control-center .notification-row .notification-background .notification>*:last-child>* {
        min-height: 3rem;
    }

    .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action {
        border-radius: 0.5rem;
        color: #${palette.foreground};
        background-color: #1f1d2e;
        border: 1px solid #${palette.color12};
    }

    .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
        background-color: #${palette.background};
    }

    .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
        background-color: #${palette.background};
    }

    .control-center .notification-row .notification-background .close-button {
        margin: 0.5rem;
        padding: 0.25rem;
        border-radius: 0.5rem;
        color: #${palette.foreground};
        background-color: #${palette.color1};
    }

    .control-center .notification-row .notification-background .close-button:hover {
        color: #191724;
    }

    .control-center .notification-row .notification-background .close-button:active {
        background-color: #ebbcba;
    }

    progressbar,
    progress,
    trough {
        border-radius: 0.5rem;
    }

    .notification.critical progress {
        background-color: #f38ba8;
    }

    .notification.low progress,
    .notification.normal progress {
        background-color: #89b4fa;
    }

    trough {
        background-color: #313244;
    }

    .control-center trough {
        background-color: #45475a;
    }

    .control-center-dnd {
        margin: 1rem 0;
        border-radius: 0.5rem;
    }

    .control-center-dnd slider {
        background: #26233a;
        border-radius: 0.5rem;
    }

    .widget-dnd {
        color: #908caa;
    }

    .widget-dnd>switch {
        border-radius: 0.5rem;
        background: #26233a;
        border: 1px solid #6e6a86;
    }

    .widget-dnd>switch:checked slider {
        background: #31748f;
    }

    .widget-dnd>switch slider {
        background: #6e6a86;
        border-radius: 0.5rem;
        margin: 0.25rem;
    }
  '';
}
