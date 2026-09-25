import QtQuick
import QtQuick.Controls.impl

import "../components"
import "../services"
import "../theme"

Surface {
    id: root

    anchors.fill: parent
    clip: true

    readonly property bool hasArt: MediaService.artUrl.length > 0

    Item {
        id: artFrame

        anchors {
            fill: parent
            margins: Theme.sizes.paddingXS
        }

        clip: true

        Image {
            anchors.fill: parent
            visible: root.hasArt && MediaService.active
            source: MediaService.artUrl
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            cache: true
            smooth: true
        }

        Rectangle {
            anchors.fill: parent
            visible: MediaService.active
            color: root.hasArt ? Theme.colors.overlay : Theme.colors.transparent
            radius: Theme.radius.pill
        }
    }

    // Double-click left → previous, right → next (under the play button)
    MouseArea {
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: parent.width / 2
        enabled: MediaService.active
        onDoubleClicked: MediaService.previous()
    }

    MouseArea {
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        width: parent.width / 2
        enabled: MediaService.active
        onDoubleClicked: MediaService.next()
    }

    Row {
        id: content

        anchors {
            fill: parent
            leftMargin: Theme.sizes.paddingM
            rightMargin: Theme.sizes.paddingM
        }

        spacing: Theme.sizes.spacingS
        visible: MediaService.active
        z: 1

        Item {
            id: playButton

            width: Theme.sizes.iconSmall
            height: parent.height

            IconImage {
                anchors.centerIn: parent
                width: Theme.sizes.iconSmall
                height: Theme.sizes.iconSmall
                source: MediaService.playing ? "../assets/icons/actions/pause.svg" : "../assets/icons/actions/play.svg"
                color: Theme.colors.textPrimary
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: MediaService.playPause()
            }
        }

        Text {
            id: title

            width: Math.max(0, content.width - playButton.width - content.spacing)
            height: parent.height

            text: MediaService.displayTitle
            color: Theme.colors.textPrimary
            font.weight: Theme.typography.weightBold
            font.pixelSize: Theme.typography.body

            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            maximumLineCount: 1
        }
    }
}
