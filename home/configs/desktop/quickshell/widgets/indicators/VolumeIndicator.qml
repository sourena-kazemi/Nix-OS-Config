import QtQuick

import "../../components"
import "../../components/icons"
import "../../services"
import "../../theme"

Item {
    id: root
    implicitWidth: content.implicitWidth
    implicitHeight: Theme.sizes.barHeight

    property bool previewPercentage: false

    property int wheelAccumulator: 0

    MouseArea {
        id: content
        anchors.centerIn: parent

        hoverEnabled: true

        implicitWidth: volume.implicitWidth
        implicitHeight: volume.implicitHeight

        onEntered: root.previewPercentage = true
        onExited: root.previewPercentage = false

        onWheel: function (wheel) {
            wheelAccumulator += wheel.angleDelta.y;

            while (wheelAccumulator >= 120) {
                AudioService.increase();
                wheelAccumulator -= 120;
            }

            while (wheelAccumulator <= -120) {
                AudioService.decrease();
                wheelAccumulator += 120;
            }

            root.previewPercentage = true;
            previewTimer.restart();

            wheel.accepted = true;
        }

        AnimatedSwitcher {
            id: volume

            currentIndex: root.previewPercentage ? 1 : 0

            first: Component {
                Item {
                    implicitWidth: volumeIcon.implicitWidth
                    implicitHeight: volumeIcon.implicitHeight
                    VolumeIcon {
                        id: volumeIcon
                        visible: !root.previewPercentage

                        percentage: AudioService.percentage
                        muted: AudioService.muted
                        available: AudioService.audio != null

                        anchors.centerIn: parent
                    }
                }
            }

            second: Component {
                Item {
                    implicitWidth: volumePercentage.implicitWidth
                    implicitHeight: volumePercentage.implicitHeight
                    Text {
                        id: volumePercentage
                        text: AudioService.percentage + "%"

                        color: Theme.colors.textPrimary
                        font.weight: Theme.typography.weightBold
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
