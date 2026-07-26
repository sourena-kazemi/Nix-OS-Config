import Quickshell
import "."
import "theme"

ShellRoot {
    PanelWindow {
        implicitHeight: Theme.sizes.barHeight
        color: Theme.colors.transparent

        anchors {
            left: true
            right: true
            top: true
        }
        margins {
            top: Theme.sizes.paddingS
        }

        Bar {}
    }
}
