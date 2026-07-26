import QtQuick
import "../services"
import "../components"
import "../theme"

Surface {
    implicitWidth: content.implicitWidth + Theme.sizes.paddingL * 2
    implicitHeight: content.implicitHeight + Theme.sizes.paddingM * 2

    Row {
        id: content
        spacing: Theme.sizes.spacingM
        anchors.centerIn: parent

        Text {
            text: TimeService.formatTime(TimeService.now)
            font.weight: Theme.typography.weightBold
            color: Theme.colors.textPrimary
        }
        Text {
            text: TimeService.formatGregorianDate(TimeService.now)
            font.weight: Theme.typography.weightBold
            color: Theme.colors.textPrimary
        }
    }
}
