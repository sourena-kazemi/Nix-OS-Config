import QtQuick

QtObject {
    readonly property real scale: 1

    readonly property string family: "Inter"
    readonly property string monoFamily: "Inter"

    readonly property real tiny: 10 * scale
    readonly property real small: 12 * scale
    readonly property real subtitle: 14 * scale
    readonly property real body: 16 * scale
    readonly property real title: 18 * scale
    readonly property real display: 20 * scale

    readonly property int weightNormal: Font.Normal
    readonly property int weightMedium: Font.Medium
    readonly property int weightBold: Font.Bold
}
