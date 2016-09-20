import QtQuick 2.7
import QtQuick.Particles 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "qrc:///metrics/elements/"

// FakeMetric - Metric box, for testing purposes

Item {
    id: fakeMetric

    // make these properties available to the outside world
    property alias title: title.title
    property alias value: metricValue.value
    property int min: 0    // for random number generator
    property int max: 100  // for random number generator
    property bool risingSeries: true // for random number generator

    // preserve aspect when used by a layout positioner
    Layout.minimumWidth: 100
    Layout.minimumHeight: width
    Layout.preferredWidth: 220
    Layout.preferredHeight: width
    Layout.maximumWidth: 400
    Layout.maximumHeight: width
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    Layout.fillWidth: true
    Layout.fillHeight: true

    // fallback when not used by a layout positioner
    width: application.metricSizeWidth
    height: width

    // fancy particle emitter
    StarEmitter {
        id: starsEmitter
    }

    // visible metric box
    Rectangle {
        id: metricRectangle
        property color topGradientColor: theme.metricTopGradientColor
        property color bottomGradientColor: theme.metricBottomGradientColor
        anchors.fill: parent
        radius: theme.metricRadius
        z: starsEmitter.z + 1

        border.color: theme.metricBorderColor
        border.width: theme.metricBorderWidth

        gradient: Gradient {
            GradientStop {
                position: 0
                color: metricRectangle.topGradientColor
            }

            GradientStop {
                position: 1
                color: metricRectangle.bottomGradientColor
            }
        }

        MetricTitle {
            id: title
        }

        // background graph
        BarGraph {
            id: graph

            // populate graph with random data, as we are Fake
            Timer {
                running: true
                interval: application.metricInterval + Math.random() * application.metricInterval
                repeat: true
                triggeredOnStart: true
                onTriggered: {
                    // TODO: refactor this to make it easier to read
                    var randomNumber
                    var graphSeries = []

                    function sortNumber(a,b) {
                        return a - b;
                    }

                    if (risingSeries) {
                        randomNumber = Math.round(Math.random() * (0.1 * min + 2)) + fakeMetric.value
                    } else {
                        randomNumber = Math.round(Math.random() * max + min)
                    }

                    // pre-warm the graph with randomness
                    if (graph.countValues() < 2) {

                        for (var i=0; i<10; i++) {
                            graphSeries.push(Math.floor(Math.random() * max + min))
                        }

                        if (risingSeries) {
                            graphSeries.sort(sortNumber)
                        }

                        for (var i=0; i<10; i++) {
                            var number = graphSeries[i]
                            graph.addValue(number)
                            metricValue.updateValue(number)
                            changeIndicator.updateValue(number)
                        }
                    } else {
                        graph.addValue(randomNumber)
                        metricValue.updateValue(randomNumber)
                        changeIndicator.updateValue(randomNumber)
                    }
                }
            }
        }

        // the big number in the middle of the metric box
        MetricValue {
            id: metricValue

            onValueChanged: {
                if (value) {
                    starsEmitter.trigger()
                }
            }

        }

        // amount changed indicator with animated up/down arrow
        ChangeIndicator {
            id: changeIndicator
        }
    }
}
