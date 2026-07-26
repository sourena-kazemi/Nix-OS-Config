import QtQuick

QtObject {
    readonly property real iconScale: 1
    readonly property real paddingScale: 1
    readonly property real spacingScale: 1

    readonly property real barHeight: 34
    readonly property real indicatorSize: 30

    readonly property real iconSmall: 16 * iconScale
    readonly property real iconMedium: 24 * iconScale
    readonly property real iconLarge: 28 * iconScale

    readonly property real badge: 10 * iconScale
    readonly property real dotSize: 4 * iconScale

    readonly property real spacingXS: 2 * spacingScale
    readonly property real spacingS: 4 * spacingScale
    readonly property real spacingM: 8 * spacingScale
    readonly property real spacingL: 12 * spacingScale
    readonly property real spacingXL: 16 * spacingScale

    readonly property real paddingXS: 4 * paddingScale
    readonly property real paddingS: 8 * paddingScale
    readonly property real paddingM: 12 * paddingScale
    readonly property real paddingL: 16 * paddingScale

    readonly property real panelPadding: 12 * paddingScale
    readonly property real panelGap: 8 * spacingScale

    readonly property real borderWidth: 1
}
