import QtQuick 2.7

// provides an animated Bar Chart to be embedded in a metric display item

Item {
    id: barGraph

    width: parent.width
    height: parent.height / 3

    anchors.margins: 10
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom

    function clearValues() {
        data.clear()
    }

    function addValue(value) {
        if (data.count > 9) {
            data.remove(0)
        }

        data.append({'value': value})
    }

    function countValues() {
        return data.count
    }

    function barWidth() {
        return (width - 20) / data.count
    }

    function barHeight(value) {
        var series = []

        for (var i = 0; i < data.count; i++) {
            series.push(data.get(i).value)
        }

        return (value / Math.max.apply(null, series)) * height
    }

    // holds data points (starts empty, waiting to be populated)
    ListModel {
        id: data
    }

    // creates bars based on ListModel above
    ListView {
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.fill: parent
        model: data

        orientation: Qt.Horizontal

        displayMarginBeginning: barWidth()

        delegate: Item {
            id: delegateBar
            width: barWidth()
            height: {
                var resultantHeight = barHeight(value)
                if (resultantHeight === 0) {
                    return 2
                } else {
                    return resultantHeight
                }
            }
            anchors.bottom: parent.bottom
            clip: true

            Rectangle {
                width: parent.width - 10
                height: barGraph.height

                opacity: theme.barGraphOpacity

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                border.width: theme.barGraphBorderWidth
                border.color: theme.barGraphBorderColor

                gradient: theme.barGraphGradient
            }
        }

        // make bars move smoothly
        displaced: Transition {
            id: moveTransition
            SequentialAnimation {
                NumberAnimation {
                    properties: "x,y,width"
                    easing.type: Easing.OutBounce
                    duration: 1400
                }
            }
        }

        // animation on new bar added
        add: Transition {
            SequentialAnimation {
                NumberAnimation {
                    properties: "opacity"
                    from: 0
                    to: theme.barGraphOpacity
                    easing.type: Easing.InOutQuad
                    duration: 1800
                }
            }
        }

        // animation on bar removed
        remove: Transition {
            SequentialAnimation {
                NumberAnimation {
                    properties: "opacity"
                    from: theme.barGraphOpacity
                    to: 0
                    easing.type: Easing.InOutQuad
                    duration: 600
                }
            }
        }

        // animation on new bar added at creation of positioner
        populate: Transition {
            SequentialAnimation {
                NumberAnimation {
                    properties: "opacity"
                    from: 0
                    to: theme.barGraphOpacity
                    easing.type: Easing.InOutQuad
                    duration: 600
                }
            }
        }
    }
}
