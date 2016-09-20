import QtQuick 2.7

Rectangle {
    // Provides a gradient background that slowly
    // animates between randomnly selected hues
    id: background

    // starting colors, also used for color animation
    property color topGradient: theme.backgroundTopGradientColor
    property color bottomGradient: theme.backgroundBottomGradientColor
    property bool animateGradient: theme.backgroundAnimateGradient

    // returns a random Color (in #hex format)
    function randomColor() {
        var hex1 = new Array("0", "1", "2", "3", "4", "5", "6", "7",
                             "8", "9", "A", "B", "C", "D", "E", "F")
        var hex2 = new Array("0", "1", "2", "3", "4", "5", "6", "7",
                             "8", "9", "A", "B", "C", "D", "E", "F")
        var hex3 = new Array("0", "1", "2", "3", "4", "5", "6", "7",
                             "8", "9", "A", "B", "C", "D", "E", "F")
        var hex4 = new Array("0", "1", "2", "3", "4", "5", "6", "7",
                             "8", "9", "A", "B", "C", "D", "E", "F")
        var hex5 = new Array("0", "1", "2", "3", "4", "5", "6", "7",
                             "8", "9", "A", "B", "C", "D", "E", "F")
        var hex6 = new Array("0", "1", "2", "3", "4", "5", "6", "7",
                             "8", "9", "A", "B", "C", "D", "E", "F")

        var bg = "#" + hex1[Math.floor(Math.random()*hex1.length)]+
                hex2[Math.floor(Math.random()*hex2.length)]+
                hex3[Math.floor(Math.random()*hex3.length)]+
                hex4[Math.floor(Math.random()*hex4.length)]+
                hex5[Math.floor(Math.random()*hex5.length)]+
                hex6[Math.floor(Math.random()*hex6.length)]

        return bg
    }

    // here is the gradient object that we will animate
    gradient: Gradient {
        GradientStop {
            position: 0
            color: topGradient
        }
        GradientStop {
            position: 0.2
            color: bottomGradient
        }
        GradientStop {
            position: 1
            color: bottomGradient
        }
    }

    // this is our animation controller (as a Behavior)
    Behavior on bottomGradient {
        ColorAnimation {
            duration: 120000
        }
    }

    // this will set a new random color that our behaviour will animate to
    Timer {
        running: animateGradient // only if enabled in the theme
        repeat: true
        onTriggered: {
            bottomGradient = randomColor()
        }
    }
}
