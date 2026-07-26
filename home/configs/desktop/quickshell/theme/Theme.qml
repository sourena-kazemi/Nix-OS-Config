pragma Singleton

import QtQuick
import "."

QtObject {
    readonly property Colors colors: Colors {}
    readonly property Sizes sizes: Sizes {}
    readonly property Radius radius: Radius {}
    readonly property Typography typography: Typography {}
    readonly property Motion motion: Motion {}
    readonly property Metadata metadata: Metadata {}
}
