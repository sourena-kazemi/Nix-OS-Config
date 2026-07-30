import QtQuick
import QtQuick.Controls.impl

import "../../theme"

Item {
    id: root

    property int percentage: 100
    property bool muted: false
    property bool available: true

    readonly property int level: {
        if (percentage <= 20)
            return 0;

        if (percentage <= 50)
            return 1;

        return 2;
    }

    implicitWidth: Theme.sizes.iconMedium
    implicitHeight: Theme.sizes.iconMedium

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/volume/volume-frame.svg"
        color: Theme.colors.textPrimary
        visible: !root.muted
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/volume/volume-level-" + root.level + ".svg"
        color: Theme.colors.accent
        visible: !root.muted && root.level > 0
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/volume/volume-none.svg"
        color: Theme.colors.danger
        visible: !root.muted && !available
    }

    IconImage {
        anchors.fill: parent
        visible: root.muted
        source: "../../assets/icons/volume/volume-off.svg"
        color: Theme.colors.muted
    }
}
