import QtQuick

import "../services"
import "../components"
import "../theme"

Surface {
    id: root

    implicitWidth: content.implicitWidth + Theme.sizes.paddingL * 2
    implicitHeight: Theme.sizes.barHeight

    property bool secondsEnabled: false
    property bool jalaliEnabled: false

    property bool previewSeconds: false
    property bool previewJalali: false

    property bool secondsClickedWhilePreviewing: false
    property bool jalaliClickedWhilePreviewing: false

    readonly property bool showSeconds: previewSeconds ? (secondsClickedWhilePreviewing ? secondsEnabled : !secondsEnabled) : secondsEnabled
    readonly property bool showJalali: previewJalali ? (jalaliClickedWhilePreviewing ? jalaliEnabled : !jalaliEnabled) : jalaliEnabled

    Row {
        id: content

        anchors.centerIn: parent
        spacing: Theme.sizes.spacingM

        MouseArea {
            hoverEnabled: true

            implicitWidth: time.implicitWidth
            implicitHeight: time.implicitHeight

            onEntered: {
                root.previewSeconds = true;
                root.secondsClickedWhilePreviewing = false;
            }

            onExited: {
                root.previewSeconds = false;
                root.secondsClickedWhilePreviewing = false;
            }

            onClicked: {
                root.secondsEnabled = !root.secondsEnabled;
                root.secondsClickedWhilePreviewing = true;
            }

            Text {
                id: time

                text: root.showSeconds ? TimeService.formatTimeWithSeconds(TimeService.now) : TimeService.formatTime(TimeService.now)

                font.weight: Theme.typography.weightBold
                color: Theme.colors.textPrimary
            }
        }

        MouseArea {
            hoverEnabled: true

            implicitWidth: date.implicitWidth
            implicitHeight: date.implicitHeight

            onEntered: {
                root.previewJalali = true;
                root.jalaliClickedWhilePreviewing = false;
            }

            onExited: {
                root.previewJalali = false;
                root.jalaliClickedWhilePreviewing = false;
            }

            onClicked: {
                root.jalaliEnabled = !root.jalaliEnabled;
                root.jalaliClickedWhilePreviewing = true;
            }

            Text {
                id: date

                text: root.showJalali ? TimeService.formatJalaliDate(TimeService.now) : TimeService.formatGregorianDate(TimeService.now)

                font.weight: Theme.typography.weightBold
                color: Theme.colors.textPrimary
            }
        }
    }
}
