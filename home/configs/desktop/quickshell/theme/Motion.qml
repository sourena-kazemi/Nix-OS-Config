import QtQuick

QtObject {
    readonly property real durationScale: ThemeLoader.motion.durationScale

    readonly property int instant: 0

    readonly property int fast: 120 * durationScale
    readonly property int normal: 200 * durationScale
    readonly property int slow: 350 * durationScale

    readonly property int easing: Easing[ThemeLoader.data.motion.easing]
}
