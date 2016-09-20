import QtQuick 2.7
import QtQuick.Particles 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "qrc:///metrics/elements/"
import "qrc:///metrics/datacollectors/"

// GraphiteMetric - Metric box, for data that comes out of Graphite (in json format)

Item {
    id: metric

    // make these properties available to the outside world
    property alias title: title.title
    property alias value: metricValue.value
    property alias graphiteBaseURL: graphiteValue.graphiteBaseURL
    property alias graphiteQuery: graphiteValue.graphiteQuery

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

        // non-visible element, datacollector
        GraphiteValue {
            id: graphiteValue

            // update metric value with most recent graphite values
            onUpdateCounterChanged: {
                if (dataValue) {
                    metricValue.updateValue(dataValue)
                    //graph.addValue(dataValue)
                    changeIndicator.updateValue(dataValue)
                }

                if (dataValues) {
                    graph.clearValues()

                    for (var i=0; i<dataValues.length; i++) {
                        graph.addValue(Math.round(dataValues[i]))
                    }
                }
            }
        }
    }
}
