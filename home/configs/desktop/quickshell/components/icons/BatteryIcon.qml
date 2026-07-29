import QtQuick
import QtQuick.Controls.impl

import "../../theme"

Item {
    id: root

    property int percentage: 100
    property bool charging: false
    property bool powerSaving: false
    property bool warning: false

    readonly property int level: {
        if (percentage <= 30)
            return 1;

        if (percentage <= 80)
            return 2;

        return 3;
    }

    implicitWidth: Theme.sizes.iconMedium
    implicitHeight: Theme.sizes.iconMedium

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/battery/battery-frame.svg"
        color: Theme.colors.textPrimary
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/battery/battery-level-" + root.level + ".svg"
        color: Theme.colors.accent
        visible: !(root.charging || root.powerSaving || root.warning)
    }

    IconImage {
        anchors.fill: parent
        visible: root.charging
        source: "../../assets/icons/battery/battery-charging.svg"
        color: Theme.colors.accent
    }

    IconImage {
        anchors.fill: parent
        visible: root.powerSaving
        source: "../../assets/icons/battery/battery-powerSaving.svg"
        color: Theme.colors.accent
    }

    IconImage {
        anchors.fill: parent
        visible: root.warning
        source: "../../assets/icons/battery/battery-warning.svg"
        color: Theme.colors.accent
    }
}
