import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import "qrc:///configs/"
import "qrc:///themes/"

// this is the main application window
Window {
    id: application
    // we want the full screen button
    // (need to provide all window flags when overriding defaults)
    flags: Qt.CustomizeWindowHint |
           Qt.WindowTitleHint |
           Qt.WindowCloseButtonHint |
           Qt.WindowMinimizeButtonHint |
           Qt.WindowMaximizeButtonHint |
           Qt.WindowFullscreenButtonHint
    visible: true
    width: 1240
    height: 800
    title: "Resplendent Board" // displayed in window title bar

    // pick a theme, any theme, just pick one
    BaseTheme {
        id: theme
    }

    // global properties go here (yum!); readonly because we are not evil ;-)
    readonly property int metricSizeWidth: 195
    readonly property int metricInterval: 30 * 1000

    // this is where the good stuff begins
    Rectangle {
        id: root
        anchors.fill: parent

        Background {
            anchors.fill: parent
        }

        Column {
            anchors.fill: parent
            anchors.leftMargin: 0
            anchors.rightMargin: 10

            // the board title that is displayed above the metrics
            Title {
                id: title
                titleText: config.boardTitle
            }

            // metrics wrapper
            Item {
                width: parent.width
                height: parent.height - title.height - 10

                // place your dashboard metrics here (from /configs) - should have an id of "config"
                FakeTeamBoard {
                    id: config
                }
            }

        }

    }

}
