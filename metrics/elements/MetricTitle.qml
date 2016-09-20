import QtQuick 2.7

// Metric box title

Item {
    property alias title: titleText.text
    property alias color: titleText.color

    width: parent.width
    anchors.top: parent.top
    anchors.margins: 10
    anchors.topMargin: 5

    Text {
        id: titleText
        color: theme.metricTitleColor

        width: parent.width
        horizontalAlignment: Text.AlignHCenter

        opacity: theme.metricTitleOpacity

        leftPadding: 6
        rightPadding: 6

        minimumPixelSize: 16
        font.pixelSize: 120
        fontSizeMode: Text.HorizontalFit
        font.bold: true
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        maximumLineCount: 3

        elide: Text.ElideMiddle

        lineHeight: lineCount > 2 ? 0.92 : 1
        lineHeightMode: Text.ProportionalHeight

        style: Text.Raised
        styleColor: theme.metricTitleStyleColor
    }

}
