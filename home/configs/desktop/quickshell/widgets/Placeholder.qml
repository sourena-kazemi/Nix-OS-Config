import QtQuick
import Quickshell

Rectangle {
    property string title: ""

    Text {
        anchors.centerIn: parent
        text: parent.title
    }
}
