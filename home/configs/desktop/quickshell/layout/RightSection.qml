import QtQuick

import "../components"
import "../widgets/indicators"
import "../theme"

Item {
    Surface {
        anchors.fill: parent
        BatteryIndicator {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
        }
    }
}
