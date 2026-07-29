import QtQuick

import "../../components"
import "../../components/icons"
import "../../services"
import "../../theme"

Item {
    id: root
    implicitWidth: content.implicitWidth + Theme.sizes.paddingL * 2
    implicitHeight: Theme.sizes.barHeight

    property bool previewPercentage: false

    MouseArea {
        id: content
        anchors.centerIn: parent

        hoverEnabled: true

        implicitWidth: battery.implicitWidth
        implicitHeight: battery.implicitHeight

        onEntered: root.previewPercentage = true
        onExited: root.previewPercentage = false

        AnimatedSwitcher {
            id: battery

            currentIndex: root.previewPercentage ? 1 : 0

            first: Component {
                Item {
                    implicitWidth: batteryIcon.implicitWidth
                    implicitHeight: batteryIcon.implicitHeight
                    BatteryIcon {
                        id: batteryIcon
                        visible: !root.previewPercentage

                        percentage: BatteryService.percentage
                        charging: BatteryService.charging
                        warning: BatteryService.criticalBattery
                        powerSaving: false

                        anchors.centerIn: parent
                    }
                }
            }

            second: Component {
                Item {
                    implicitWidth: batteryPercentage.implicitWidth
                    implicitHeight: batteryPercentage.implicitHeight
                    Text {
                        id: batteryPercentage
                        text: BatteryService.percentage + "%"

                        color: Theme.colors.textPrimary
                        font.weight: Theme.typography.weightBold
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
