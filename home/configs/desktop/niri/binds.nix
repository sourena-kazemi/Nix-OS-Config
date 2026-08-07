{
  config,
  ...
}:

{
  binds = with config.lib.niri.actions; {
    "Mod+Shift+Slash".action.show-hotkey-overlay = { };

    "Mod+Return" = {
      hotkey-overlay.title = "Open a Terminal: ghostty";
      action.spawn = "ghostty";
    };
    "Mod+B" = {
      hotkey-overlay.title = "Open a Browser: Chrome";
      action.spawn = "google-chrome-stable";
    };
    "Mod+O" = {
      hotkey-overlay.title = "Open Notes: Obsidian";
      action.spawn = "obsidian";
    };
    "Mod+I" = {
      hotkey-overlay.title = "Open Code: VSCode";
      action.spawn = "code";
    };
    "Mod+D" = {
      hotkey-overlay.title = "Open Launcher: Fuzzel";
      action.spawn = "fuzzel";
    };
    "Mod+T" = {
      hotkey-overlay.title = "Open Telegram";
      action.spawn = "Telegram";
    };

    "Mod+Space".action.switch-layout = "next";

    "Mod+Q".action.close-window = { };

    "Mod+G".action.focus-column-first = { };
    "Mod+Shift+G".action.focus-column-last = { };
    "Mod+H".action.focus-column-left = { };
    "Mod+J".action.focus-window-down = { };
    "Mod+K".action.focus-window-up = { };
    "Mod+L".action.focus-column-right = { };

    "Mod+Ctrl+H".action.focus-monitor-left = { };
    "Mod+Ctrl+J".action.focus-workspace-down = { };
    "Mod+Ctrl+K".action.focus-workspace-up = { };
    "Mod+Ctrl+L".action.focus-monitor-right = { };

    "Mod+Ctrl+G".action.move-column-to-first = { };
    "Mod+Ctrl+Shift+G".action.move-column-to-last = { };
    "Mod+Shift+H".action.move-column-left = { };
    "Mod+Shift+J".action.move-window-down = { };
    "Mod+Shift+K".action.move-window-up = { };
    "Mod+Shift+L".action.move-column-right = { };

    "Mod+Ctrl+Shift+H".action.move-column-to-monitor-left = { };
    "Mod+Ctrl+Shift+J".action.move-column-to-workspace-down = { };
    "Mod+Ctrl+Shift+K".action.move-column-to-workspace-up = { };
    "Mod+Ctrl+Shift+L".action.move-column-to-monitor-right = { };

    "Mod+Ctrl+Alt+H".action.move-window-to-monitor-left = { };
    "Mod+Ctrl+Alt+J".action.move-window-to-workspace-down = { };
    "Mod+Ctrl+Alt+K".action.move-window-to-workspace-up = { };
    "Mod+Ctrl+Alt+L".action.move-window-to-monitor-right = { };

    "Mod+Ctrl+WheelScrollDown" = {
      action.focus-workspace-down = { };
      cooldown-ms = 150;
    };
    "Mod+Ctrl+WheelScrollUp" = {
      action.focus-workspace-up = { };
      cooldown-ms = 150;
    };
    "Mod+Ctrl+Shift+WheelScrollDown" = {
      action.move-column-to-workspace-down = { };
      cooldown-ms = 150;
    };
    "Mod+Ctrl+Shift+WheelScrollUp" = {
      action.move-column-to-workspace-up = { };
      cooldown-ms = 150;
    };

    "Mod+WheelScrollDown".action.focus-column-right = { };
    "Mod+WheelScrollUp".action.focus-column-left = { };
    "Mod+Shift+WheelScrollDown".action.move-column-right = { };
    "Mod+Shift+WheelScrollUp".action.move-column-left = { };

    "Mod+Grave".action.focus-workspace-previous = { };
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;

    "Mod+Shift+1".action.move-window-to-workspace = 1;
    "Mod+Shift+2".action.move-window-to-workspace = 2;
    "Mod+Shift+3".action.move-window-to-workspace = 3;
    "Mod+Shift+4".action.move-window-to-workspace = 4;
    "Mod+Shift+5".action.move-window-to-workspace = 5;
    "Mod+Shift+6".action.move-window-to-workspace = 6;
    "Mod+Shift+7".action.move-window-to-workspace = 7;
    "Mod+Shift+8".action.move-window-to-workspace = 8;
    "Mod+Shift+9".action.move-window-to-workspace = 9;

    "Mod+Tab".action.toggle-overview = { };

    "Mod+F".action.maximize-column = { };
    "Mod+Shift+F".action.fullscreen-window = { };

    "Mod+C".action.center-column = { };
    "Mod+Shift+C".action.center-visible-columns = { };

    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";
    "Mod+Shift+Minus".action.set-window-height = "-10%";
    "Mod+Shift+Equal".action.set-window-height = "+10%";

    "Mod+V".action.toggle-window-floating = { };
    "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = { };

    "Mod+W".action.toggle-column-tabbed-display = { };

    "Mod+Alt+H".action.consume-or-expel-window-left = { };
    "Mod+Alt+L".action.consume-or-expel-window-right = { };

    "Mod+Comma".action.consume-window-into-column = { };
    "Mod+Period".action.expel-window-from-column = { };

    "Mod+R".action.switch-preset-column-width = { };
    "Mod+Shift+R".action.switch-preset-window-height = { };

    "Mod+E".action.expand-column-to-available-width = { };
    "Mod+Shift+E".action.reset-window-height = { };
  };
}
