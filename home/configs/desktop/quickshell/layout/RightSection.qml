import QtQuick

import "../components"
import "../widgets/indicators"
import "../theme"

Item {
    Surface {
        anchors.fill: parent
        Row {
            spacing: Theme.sizes.spacingM
            anchors {
                right: parent.right
                rightMargin: Theme.sizes.paddingM
                leftMargin: Theme.sizes.paddingM
                verticalCenter: parent.verticalCenter
            }
            VolumeIndicator {}

            BatteryIndicator {}
        }
    }
}
