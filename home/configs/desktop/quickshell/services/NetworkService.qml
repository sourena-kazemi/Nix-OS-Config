pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    readonly property var devices: Networking.devices.values

    readonly property var wifiDevices: devices.filter(device => device.type === DeviceType.Wifi)

    readonly property var ethernetDevices: devices.filter(device => device.type === DeviceType.Wired)

    readonly property var wifiDevice: wifiDevices.find(device => device.connected) ?? wifiDevices[0] ?? null

    readonly property var ethernetDevice: ethernetDevices.find(device => device.connected) ?? ethernetDevices[0] ?? null

    readonly property var activeWifiNetwork: wifiDevice ? wifiDevice.networks.values.find(network => network.connected) ?? null : null

    readonly property var activeEthernetNetwork: ethernetDevice && ethernetDevice.connected ? ethernetDevice.network : null

    readonly property var activeNetwork: activeWifiNetwork ?? activeEthernetNetwork

    readonly property bool wifi: activeWifiNetwork !== null

    readonly property bool ethernet: activeEthernetNetwork !== null

    readonly property bool connected: activeNetwork !== null

    readonly property bool connecting: wifiDevice ? wifiDevice.networks.values.some(network => network.stateChanging) : false

    readonly property bool internet: Networking.connectivity === NetworkConnectivity.Full

    readonly property bool noInternet: connected && !internet

    readonly property string name: activeNetwork ? activeNetwork.name : ""

    readonly property real strength: activeWifiNetwork ? activeWifiNetwork.signalStrength : 1.0

    function disconnect() {
        if (wifiDevice && wifiDevice.connected)
            wifiDevice.disconnect();

        if (ethernetDevice && ethernetDevice.connected)
            ethernetDevice.disconnect();
    }

    function reconnect() {
        if (activeNetwork)
            activeNetwork.connect();
    }
}
