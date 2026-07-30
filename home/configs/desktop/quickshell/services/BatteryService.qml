pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

QtObject {
    id: root

    readonly property var battery: UPower.displayDevice

    readonly property int percentage: battery ? Math.round(battery.percentage * 100) : 0

    readonly property bool charging: battery ? battery.state === UPowerDeviceState.Charging : false

    readonly property bool pluggedIn: battery ? battery.state === UPowerDeviceState.Charging || battery.state === UPowerDeviceState.PendingCharge || battery.state === UPowerDeviceState.FullyCharged : false

    readonly property bool lowBattery: percentage <= 20

    readonly property bool criticalBattery: percentage <= 10

    readonly property bool available: battery !== null
}
