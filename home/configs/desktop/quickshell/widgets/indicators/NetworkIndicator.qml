import QtQuick

import "../../components"
import "../../components/icons"
import "../../services"
import "../../theme"

Item {
    id: root
    implicitWidth: batteryIcon.implicitWidth + 2 * Theme.sizes.paddingM
    implicitHeight: Theme.sizes.barHeight

    NetworkIcon {
        id: batteryIcon

        strength: NetworkService.strength
        noInternet: NetworkService.noInternet
        connecting: NetworkService.connecting
        wifi: NetworkService.wifi
        ethernet: NetworkService.ethernet

        anchors.centerIn: parent
    }
}
