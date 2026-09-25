import QtQuick
import QtQuick.Controls.impl
import QtQuick.Effects

import "../components"
import "../services"
import "../theme"

Surface {
    id: root

    anchors.fill: parent

    implicitWidth: MediaService.active
            ? 300
            : Theme.sizes.iconSmall + (2*Theme.sizes.paddingM)

    Behavior on implicitWidth {
        NumberAnimation {
            duration: Theme.motion.normal
            easing.type: Theme.motion.easing
        }
    }

    clip: true

    readonly property bool hasArt: MediaService.artUrl.length > 0

    Item {
        id: artFrame

        anchors {
            fill: parent
            margins: Theme.sizes.paddingXS
        }

        Image {
            id: cover

            anchors.fill: parent

            visible: root.hasArt && MediaService.active
            source: MediaService.artUrl

            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            cache: true
            smooth: true

            layer.enabled: true
            layer.effect: MultiEffect {
                maskEnabled: true
                maskSource: mask
            }
        }

        Rectangle {
            id: mask

            anchors.fill: parent
            radius: Theme.radius.pill
            visible: false
            layer.enabled: true
        }

        Rectangle {
            anchors.fill: parent
            visible: root.hasArt && MediaService.active

            radius: Theme.radius.pill

            // Dedicated dark scrim over album artwork.
            color: "#70000000"
        }
    }

    Item {
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        width: parent.width / 2

        TapHandler {
            acceptedButtons: Qt.LeftButton
            exclusiveSignals: TapHandler.SingleTap | TapHandler.DoubleTap

            onSingleTapped: MediaService.playPause()
            onDoubleTapped: MediaService.previous()
        }
    }

    Item {
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        width: parent.width / 2

        TapHandler {
            acceptedButtons: Qt.LeftButton
            exclusiveSignals: TapHandler.SingleTap | TapHandler.DoubleTap

            onSingleTapped: MediaService.playPause()
            onDoubleTapped: MediaService.next()
        }
    }

    Row {
        id: content

        anchors {
            fill: parent
            leftMargin: Theme.sizes.paddingM
            rightMargin: Theme.sizes.paddingM
        }

        spacing: Theme.sizes.spacingS
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
        }

        Text {
            id: title

            width: Math.max(0, content.width - playButton.width - content.spacing)
            height: parent.height

            text: MediaService.displayTitle
            color: Theme.colors.textPrimary
            font.weight: Theme.typography.weightBold
            font.pixelSize: Theme.typography.small

            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            maximumLineCount: 1
        }
    }
}
