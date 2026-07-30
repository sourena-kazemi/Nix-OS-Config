import QtQuick

import "../components"
import "../widgets/indicators"
import "../theme"

Item {
    Surface {
        anchors.fill: parent
        Row {
            anchors {
                right: parent.right
                rightMargin: Theme.sizes.paddingM
                leftMargin: Theme.sizes.paddingM
                verticalCenter: parent.verticalCenter
            }

            NetworkIndicator {}

            VolumeIndicator {}

            BatteryIndicator {}
        }
    }
}
