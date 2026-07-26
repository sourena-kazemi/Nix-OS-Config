import QtQuick
import "../theme"

Item {

    property string name: ""
    property string overlay: ""

    implicitWidth: Theme.sizes.iconMedium
    implicitHeight: Theme.sizes.iconMedium

    Image {
        id: icon

        source: "../assets/shell-icons/" + name + ".svg"

        fillMode: Image.PreserveAspectFit

        smooth: true
    }

    Text {
        visible: overlay.length > 0

        text: overlay

        anchors.right: parent.right
        anchors.bottom: parent.bottom

        font.pixelSize: Theme.typography.subtitle
        font.weight: Theme.typography.weightBold

        color: Theme.colors.textPrimary
    }
}
