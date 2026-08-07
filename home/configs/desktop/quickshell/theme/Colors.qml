import QtQuick

QtObject {
    readonly property color background: ThemeLoader.colors.background
    readonly property color surface: ThemeLoader.colors.surface
    readonly property color surfaceVariant: ThemeLoader.colors.surfaceVariant
    readonly property color overlay: ThemeLoader.colors.overlay

    readonly property color textPrimary: ThemeLoader.colors.primary
    readonly property color textSecondary: ThemeLoader.colors.secondary
    readonly property color textDisabled: ThemeLoader.colors.disabled

    readonly property color accent: ThemeLoader.colors.accent
    readonly property color success: ThemeLoader.colors.success
    readonly property color warning: ThemeLoader.colors.warning
    readonly property color danger: ThemeLoader.colors.danger
    readonly property color info: ThemeLoader.colors.info
    readonly property color muted: ThemeLoader.colors.muted

    readonly property color border: ThemeLoader.colors.border
    readonly property color separator: ThemeLoader.colors.separator
    readonly property color shadow: ThemeLoader.colors.shadow

    readonly property color transparent: "#00000000"
}
