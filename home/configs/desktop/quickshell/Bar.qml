import QtQuick
import "layout"
import "theme"

Item {
    id: root
    anchors.fill: parent

    LeftSection {
        id: leftSection

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom

            leftMargin: Theme.sizes.paddingM
        }

        width: parent.width * 0.20
    }

    CenterSection {
        anchors.centerIn: parent
    }

    RightSection {
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom

            rightMargin: Theme.sizes.paddingM
        }

        width: 300
    }
}
