import QtQuick
import QtQuick.Controls.impl

import "../../theme"

Item {
    id: root

    property real strength: 1.0
    property bool noInternet: false
    property bool connecting: false
    property bool wifi: true
    property bool ethernet: false

    readonly property bool showWifiLevel: wifi && !connecting && !noInternet

    readonly property int level: {
        if (strength <= 0.25)
            return 1;

        if (strength <= 0.5)
            return 2;

        if (strength <= 0.75)
            return 3;

        return 4;
    }

    implicitWidth: Theme.sizes.iconMedium
    implicitHeight: Theme.sizes.iconMedium

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/wifi-level-1.svg"
        color: Theme.colors.textPrimary
        visible: showWifiLevel
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/wifi-level-2.svg"
        color: level >= 2 ? Theme.colors.textPrimary : Theme.colors.muted
        visible: showWifiLevel
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/wifi-level-3.svg"
        color: level >= 3 ? Theme.colors.textPrimary : Theme.colors.muted
        visible: showWifiLevel
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/wifi-level-4.svg"
        color: level >= 4 ? Theme.colors.textPrimary : Theme.colors.muted
        visible: showWifiLevel
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/wifi-status-frame.svg"
        color: Theme.colors.textPrimary
        visible: connecting || noInternet
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/wifi-status-connecting.svg"
        color: Theme.colors.accent
        visible: connecting
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/wifi-status-noInternet.svg"
        color: Theme.colors.accent
        visible: noInternet
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/ethernet.svg"
        color: Theme.colors.textPrimary
        visible: ethernet
    }

    IconImage {
        anchors.fill: parent
        source: "../../assets/icons/network/network-off.svg"
        color: Theme.colors.muted
        visible: !ethernet && !wifi && !connecting
    }
}
