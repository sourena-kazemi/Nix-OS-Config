import QtQuick

import "../components"
import "../widgets/indicators"
import "../theme"

Item {
    implicitWidth: content.implicitWidth
    implicitHeight: content.implicitHeight

    Surface {
        id: content

        implicitWidth: indicators.implicitWidth + Theme.sizes.paddingM * 2
        implicitHeight: indicators.implicitHeight

        anchors.fill: parent

        Row {
            id: indicators
            anchors {
                right: parent.right
                rightMargin: Theme.sizes.paddingM
                leftMargin: Theme.sizes.paddingM
                verticalCenter: parent.verticalCenter
            }

            KeyboardIndicator {}

            NetworkIndicator {}

            VolumeIndicator {}

            BatteryIndicator {}
        }
    }
}
