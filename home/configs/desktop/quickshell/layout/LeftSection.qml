import QtQuick
import "../widgets"

import "../services"

Item {
    implicitWidth: music.implicitWidth
    
    Music {
        id:music
        anchors.fill: parent
    }
}
