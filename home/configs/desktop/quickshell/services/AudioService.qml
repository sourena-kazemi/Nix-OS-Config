pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Item {
    id: root

    readonly property var sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        id: tracker
        objects: root.sink ? [root.sink] : []
    }

    readonly property var audio: sink ? sink.audio : null

    readonly property real volume: audio ? audio.volume : 0

    readonly property int percentage: Math.round(volume * 100)

    readonly property bool muted: audio ? audio.muted : false

    function setVolume(value) {
        if (!audio)
            return;
        audio.volume = Math.max(0, Math.min(1, value));
    }

    function increase(step = 0.05) {
        setVolume(volume + step);
    }

    function decrease(step = 0.05) {
        setVolume(volume - step);
    }

    function toggleMute() {
        if (!audio)
            return;
        audio.muted = !muted;
    }
}
