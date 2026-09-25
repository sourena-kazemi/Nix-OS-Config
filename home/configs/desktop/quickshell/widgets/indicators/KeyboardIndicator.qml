import QtQuick

import "../../services"
import "../../theme"

Item {
    id: root

    implicitWidth: content.implicitWidth
    implicitHeight: Theme.sizes.barHeight

    property int wheelAccumulator: 0

    MouseArea {
        id: content

        anchors.centerIn: parent

        implicitWidth: label.implicitWidth
        implicitHeight: label.implicitHeight

        cursorShape: Qt.PointingHandCursor

        onClicked: KeyboardService.next()

        onWheel: function(wheel) {
            root.wheelAccumulator += wheel.angleDelta.y;

            while (root.wheelAccumulator >= 120) {
                KeyboardService.previous();
                root.wheelAccumulator -= 120;
            }

            while (root.wheelAccumulator <= -120) {
                KeyboardService.next();
                root.wheelAccumulator += 120;
            }

            wheel.accepted = true;
        }

        Text {
            id: label

            anchors.centerIn: parent

            text: KeyboardService.layout
            color: Theme.colors.textPrimary

            font.pixelSize: Theme.typography.small
            font.weight: Theme.typography.weightBold
        }
    }
}