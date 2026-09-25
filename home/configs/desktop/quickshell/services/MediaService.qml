pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property var players: Mpris.players.values

    // Prefer a playing player, then one with a track, else first available
    readonly property var player: {
        const list = players;
        if (!list || list.length === 0)
            return null;

        const playing = list.find(p => p.isPlaying);
        if (playing)
            return playing;

        const withTrack = list.find(p => p.trackTitle && p.trackTitle.length > 0);
        if (withTrack)
            return withTrack;

        return list[0];
    }

    readonly property bool active: player !== null

    readonly property bool playing: player ? player.isPlaying : false

    readonly property string title: player && player.trackTitle ? player.trackTitle : ""

    readonly property string artist: player && player.trackArtist ? player.trackArtist : ""

    readonly property string artUrl: player && player.trackArtUrl ? player.trackArtUrl : ""

    Process {
        id: kewProcess

        command: [ "kew","all" ]
    }

    function launch() {
        if (active)
            return;

        kewProcess.running = true;
    }

    function playPause() {
        if (!player) {
            launch();
            return;
        }

        player.togglePlaying();
    }

    readonly property string displayTitle: {
        if (!active)
            return "";
        if (title.length > 0)
            return title;
        if (artist.length > 0)
            return artist;
        return player.identity || "Music";
    }

    function next() {
        if (!player || !player.canGoNext)
            return;
        player.next();
    }

    function previous() {
        if (!player || !player.canGoPrevious)
            return;
        player.previous();
    }
}
