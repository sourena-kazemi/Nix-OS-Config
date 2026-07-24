import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Wayland

import "widgets"
import "layout"

Item {
    RowLayout {
        anchors.fill: parent
        LeftSection {}

        Item {
            Layout.fillWidth: true
        }

        CenterSection {}

        Item {
            Layout.fillWidth: true
        }

        RightSection {}
    }
}
