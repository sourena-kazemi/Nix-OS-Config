import QtQuick
import "../theme"

Item {
    id: root

    property int currentIndex: 0
    property bool upward: true

    property Component first
    property Component second

    clip: true

    Loader {
        id: firstLoader
        anchors.fill: parent
        sourceComponent: root.first
    }

    Loader {
        id: secondLoader
        anchors.fill: parent
        sourceComponent: root.second
    }

    implicitWidth: Math.max(firstLoader.item ? firstLoader.item.implicitWidth : 0, secondLoader.item ? secondLoader.item.implicitWidth : 0)

    implicitHeight: Math.max(firstLoader.item ? firstLoader.item.implicitHeight : 0, secondLoader.item ? secondLoader.item.implicitHeight : 0)

    states: [
        State {
            name: "first"
            when: root.currentIndex === 0

            PropertyChanges {
                target: firstLoader.item
                y: 0
            }

            PropertyChanges {
                target: secondLoader.item
                y: root.upward ? -root.height : root.height
            }
        },
        State {
            name: "second"
            when: root.currentIndex === 1

            PropertyChanges {
                target: firstLoader.item
                y: root.upward ? root.height : -root.height
            }

            PropertyChanges {
                target: secondLoader.item
                y: 0
            }
        }
    ]

    transitions: Transition {

        NumberAnimation {
            properties: "y"

            duration: Theme.motion.normal
            easing.type: Theme.motion.easing
        }
    }
}
