import QtQuick

import "../services"
import "../components"
import "../theme"

Surface {
    id: root

    implicitWidth: content.implicitWidth + Theme.sizes.paddingL * 2
    implicitHeight: Theme.sizes.barHeight

    property bool timeHovering: false
    property bool dateHovering: false

    property bool initialTime: false
    property bool initialDate: false

    property bool timeClicked: false
    property bool dateClicked: false

    property bool secondsEnabled: false
    property bool jalaliEnabled: false

    readonly property bool showSeconds: timeHovering && !timeClicked ? !initialTime : secondsEnabled
    readonly property bool showJalali: dateHovering && !dateClicked ? !initialDate : jalaliEnabled

    Row {
        id: content

        anchors.centerIn: parent
        spacing: Theme.sizes.spacingM

        MouseArea {
            hoverEnabled: true

            implicitWidth: time.implicitWidth
            implicitHeight: time.implicitHeight

            onEntered: {
                root.initialTime = showSeconds;
                root.timeClicked = false;
                root.timeHovering = true;
            }

            onExited: {
                root.timeHovering = false;
                root.timeClicked = false;
            }

            onClicked: {
                root.secondsEnabled = !root.secondsEnabled;
                root.timeClicked = true;
            }

            AnimatedSwitcher {
                id: time

                currentIndex: root.showSeconds ? 1 : 0

                first: Component {
                    Item {
                        implicitWidth: timeLabel.implicitWidth
                        implicitHeight: timeLabel.implicitHeight

                        Text {
                            id: timeLabel
                            text: TimeService.formatTime(TimeService.now)

                            font.weight: Theme.typography.weightBold
                            color: Theme.colors.textPrimary
                            anchors.centerIn: parent
                        }
                    }
                }

                second: Component {
                    Item {

                        implicitWidth: timeWithSecondsLabel.implicitWidth
                        implicitHeight: timeWithSecondsLabel.implicitHeight

                        Text {
                            id: timeWithSecondsLabel
                            text: TimeService.formatTimeWithSeconds(TimeService.now)

                            font.weight: Theme.typography.weightBold
                            color: Theme.colors.textPrimary
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }

        MouseArea {
            hoverEnabled: true

            implicitWidth: date.implicitWidth
            implicitHeight: date.implicitHeight

            onEntered: {
                root.initialDate = showJalali;
                root.dateClicked = false;
                root.dateHovering = true;
            }

            onExited: {
                root.dateHovering = false;
                root.dateClicked = false;
            }

            onClicked: {
                root.jalaliEnabled = !root.jalaliEnabled;
                root.dateClicked = true;
            }

            AnimatedSwitcher {
                id: date

                currentIndex: root.showJalali ? 1 : 0

                first: Component {

                    Item {
                        implicitWidth: dateLabel.implicitWidth
                        implicitHeight: dateLabel.implicitHeight

                        Text {
                            id: dateLabel
                            text: TimeService.formatGregorianDate(TimeService.now)

                            font.weight: Theme.typography.weightBold
                            color: Theme.colors.textPrimary
                            anchors.centerIn: parent
                        }
                    }
                }

                second: Component {

                    Item {
                        implicitWidth: jalaliDateLabel.implicitWidth + 2 * Theme.sizes.paddingS
                        implicitHeight: jalaliDateLabel.implicitHeight

                        Text {
                            id: jalaliDateLabel
                            text: TimeService.formatJalaliDate(TimeService.now)

                            font.weight: Theme.typography.weightBold
                            color: Theme.colors.textPrimary
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }
}
