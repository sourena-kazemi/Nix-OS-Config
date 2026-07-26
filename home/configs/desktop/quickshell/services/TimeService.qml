pragma Singleton

import QtQuick

Item {
    id: root

    property date now: new Date()

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            root.now = new Date();
        }
    }

    function formatTime(date) {
        return Qt.formatTime(date, "hh:mm");
    }

    function formatTimeWithSeconds(date) {
        return Qt.formatTime(date, "hh:mm:ss");
    }

    function formatGregorianDate(date) {
        return Qt.formatDate(date, "MMM dd");
    }

    function formatJalaliDate(date) {
        // TODO
        return "1405/05/04";
    }
}
