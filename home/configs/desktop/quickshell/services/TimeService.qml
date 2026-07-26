pragma Singleton

import QtQuick

import "../utils/Jalaali.js" as Jalaali

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
        const j = Jalaali.toJalaali(date.getFullYear(), date.getMonth() + 1, date.getDate());

        return `${pad(j.jm)}/${pad(j.jd)}`;
    }

    function pad(n) {
        return n < 10 ? "0" + n : n.toString();
    }
}
