import QtQuick 2.7
import "qrc:///metrics/datacollectors/js/urlQuery.js" as Query

// makes an API call to graphite on a repeating interval
// and returns queried values

// this item is designed to be embedded in a metric display item

Item {
    id: thisItem
    property string graphiteBaseURL: config.graphiteBaseURL
    property string graphiteQuery

    property int interval: 60 // in seconds
    property var data

    property int updateCounter: 0
    property int dataValue
    property var dataValues: []

    Timer {
        running: true
        repeat: true
        triggeredOnStart: true
        interval: thisItem.interval * 1000
        onTriggered: {
            data = Query.simple(
                            'GET',
                            graphiteBaseURL + graphiteQuery,
                            thisItem
                        )
        }
    }

    // returns all the value items in "datapoints" as an array
    function extractDataValues(rawData) {
        var result = []
        var dataLength = rawData[0]["datapoints"].length

        for (var i=0; i<dataLength; i++) {
            result.push(Math.round(rawData[0]["datapoints"][i][0]))
        }

        dataValue = Math.round(result[result.length - 1]) // last item is most recent value
        dataValues = result
        updateCounter += 1
    }

    onDataChanged: {
        processData()
    }

    function processData() {
        if (data) {
            extractDataValues(JSON.parse(data))
        }
    }
}
