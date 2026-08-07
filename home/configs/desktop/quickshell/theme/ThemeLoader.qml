pragma Singleton

import QtQuick
import Quickshell.Io

Item {
    id: root

    readonly property alias colors: adapter.colors
    readonly property alias motion: adapter.motion
    readonly property alias typography: adapter.typography
    readonly property alias radius: adapter.radius
    readonly property alias size: adapter.size

    FileView {
        id: file

        path: Qt.resolvedUrl("file:///home/sourena/.config/theme/current.json")

        watchChanges: true

        onFileChanged: reload()

        JsonAdapter {
            id: adapter

            property var colors: ({})
            property var motion: ({})
            property var typography: ({})
            property var radius: ({})
            property var size: ({})
        }
    }
}
