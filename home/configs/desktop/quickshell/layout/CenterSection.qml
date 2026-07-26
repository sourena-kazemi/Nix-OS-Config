import QtQuick
import "../widgets"

Item {
    implicitWidth: clock.implicitWidth
    implicitHeight: clock.implicitHeight
    Clock {
        id: clock
    }
}
