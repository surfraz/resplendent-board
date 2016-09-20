import QtQuick 2.7

Text {
    // displays a fitted title
    id: title

    property string titleText
    property color titleColor: theme.titleColor

    opacity: 0.6

    anchors.rightMargin: 30
    anchors.leftMargin: 30

    width: parent.width

    text: titleText
    color: titleColor

    horizontalAlignment: Text.AlignHCenter
    minimumPointSize: 8
    maximumLineCount: 1
    font.bold: true
    font.pointSize: 64
    fontSizeMode: Text.HorizontalFit
    elide: Text.ElideMiddle
}
