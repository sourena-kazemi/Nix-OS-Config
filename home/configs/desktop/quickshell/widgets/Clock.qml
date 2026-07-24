import QtQuick
import QtQuick.Layouts

Item {
    Rectangle {
        anchors.fill: parent
        ColumnLayout {
            anchors.centerIn: parent
            Text {
                text: "9:55 PM"
                Layout.alignment: Qt.AlignHCenter
            }

            Text {
                text: "Jul 24"
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
}
