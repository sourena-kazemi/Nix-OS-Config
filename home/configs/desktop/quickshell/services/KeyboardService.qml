pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    readonly property var layouts: ["US", "FA"]

    property int currentIndex: 0

    readonly property string layout:
        layouts[currentIndex] ?? "?"

    Process {
        id: eventStream

        running: true
        command: [ "niri", "msg", "--json", "event-stream" ]

        stdout: SplitParser {
            onRead: data => {
                try {
                    const event = JSON.parse(data);

                    if (event.KeyboardLayoutSwitched !== undefined) {
                        root.currentIndex =
                            event.KeyboardLayoutSwitched.idx;
                    }
                } catch (e) {
                    console.warn(
                        "KeyboardService: failed to parse event:",
                        e
                    );
                }
            }
        }
    }

    Process {
        id: switchProcess
    }

    function next() {
        switchProcess.command = [
            "niri", "msg", "action",
            "switch-layout", "next"
        ];

        switchProcess.running = true;
    }

    function previous() {
        switchProcess.command = [
            "niri", "msg", "action",
            "switch-layout", "prev"
        ];

        switchProcess.running = true;
    }
}