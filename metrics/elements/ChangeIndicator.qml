import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

// provides a small "amount changed" indicator with up/down arrow

Item {
    id: changeIndicator
    property int value: 0
    property int oldValue: 0
    property int difference: 0
    property color valueColor: theme.changeIndicatorValueColor

    function updateValue(newValue) {
        difference = newValue - oldValue
        oldValue = newValue
    }

    onDifferenceChanged: updateAnimation.restart()

    anchors.rightMargin: 9
    anchors.bottomMargin: 2
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    width: parent.width

    Rectangle {
        z: 20
        id: differenceBox

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: parent.width
        height: 30

        color: 'transparent'

        visible: {
            if (difference === 0) {
                return false
            } else {
                return true
            }
        }

        // fades arrow and change number in and out
        SequentialAnimation {
            id: updateAnimation
            running: false
            loops: 1
            alwaysRunToEnd: true
            SequentialAnimation {
                loops: 1
                alwaysRunToEnd: true
                SequentialAnimation {
                    loops: 3 * 12
                    alwaysRunToEnd: true
                    OpacityAnimator {
                        target: updateArrow
                        from: theme.changeIndicatorValueOpacity
                        to: 0
                        duration: 500
                        easing.type: Easing.InOutQuart
                    }
                    OpacityAnimator {
                        target: updateArrow
                        from: 0
                        to: theme.changeIndicatorValueOpacity
                        duration: 500
                        easing.type: Easing.InOutQuart
                    }
                }
                ColorAnimation {
                    target: updateValue
                    property: 'color'
                    from: valueColor
                    to: 'gray'
                    duration: 10 * 3 * 1000
                }
                ParallelAnimation {
                    OpacityAnimator {
                        target: updateValue
                        from: theme.changeIndicatorValueOpacity
                        to: 0
                        duration: 1 * 6 * 1000
                    }
                    OpacityAnimator {
                        target: updateArrow
                        from: theme.changeIndicatorValueOpacity
                        to: 0
                        duration: 1 * 6 * 1000
                    }
                }
            }
            onStarted: {
                updateValue.color = valueColor
                updateValue.opacity = theme.changeIndicatorValueOpacity
                updateArrow.opacity = theme.changeIndicatorValueOpacity
            }
        }

        RowLayout {
            width: parent.width
            anchors.right: parent.right
            Image {
                id: updateArrow
                anchors.right: updateValue.left
                anchors.rightMargin: 4
                clip: false
                height: parent.height
                sourceSize.height: height
                sourceSize.width: width
                Layout.alignment: Qt.AlignRight
                fillMode: Image.PreserveAspectFit
                source: {
                    if (parseInt(difference) > 0) {
                        return 'qrc:///images/arrow-up.png'
                    } else {
                        return 'qrc:///images/arrow-down.png'
                    }
                }

                // allow themes to color the image
                ColorOverlay {
                    anchors.fill: updateArrow
                    source: updateArrow
                    color: theme.changeIndicatorUpdateArrowColorize
                }
            }

            Text {
                id: updateValue
                color: valueColor
                font.bold: true
                opacity: theme.changeIndicatorValueOpacity
                // format using your operating system Locale settings
                text: Number(Math.abs(difference)).toLocaleString(Qt.locale(),'f',0)
                Layout.alignment: Qt.AlignRight
                style: Text.Sunken
                styleColor: theme.changeIndicatorValueStyleColor
                font.pixelSize: 24
                fontSizeMode: Text.HorizontalFit
            }
        }
    }
}
