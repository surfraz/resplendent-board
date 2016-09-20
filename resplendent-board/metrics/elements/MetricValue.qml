import QtQuick 2.7

// Big value in the middle of the metric box

Item {
    property alias color: metricValue.color
    property int value
    property int updateCounter: 0

    function updateValue(newValue) {
        value = newValue
        updateCounter += 1
    }

    anchors.fill: parent
    anchors.centerIn: parent

    // make the number animate smoothly
    Behavior on value {
        NumberAnimation {
            duration: 1000
            easing.type: Easing.InOutQuad
        }
    }

    Text {
        id: metricValue

        anchors.fill: parent
        anchors.centerIn: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        opacity: theme.metricValueOpacity

        // format using your operating system Locale settings
        // if we need decimals in the future this will need to change
        text: Number(value).toLocaleString(Qt.locale(),'f',0)

        color: theme.metricValueColor
        style: Text.Raised
        styleColor: theme.metricValueStyleColor
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        minimumPixelSize: 20
        font.pixelSize: 120
        font.bold: true
        fontSizeMode: Text.HorizontalFit
        wrapMode: Text.WordWrap
    }

}
