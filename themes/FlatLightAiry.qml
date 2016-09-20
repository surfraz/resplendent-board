import QtQuick 2.7
import "qrc:///themes/"

// We will override some properties from the BaseTheme

BaseTheme {
    // title theme
    property color titleColor: 'Black'

    // background theme
    property color backgroundTopGradientColor: 'white'
    property color backgroundBottomGradientColor: 'white'
    property bool backgroundAnimateGradient: false

    // metric box theme
    property color metricTopGradientColor: 'white'
    property color metricBottomGradientColor: 'white'
    property color metricBorderColor: 'grey'
    property int metricBorderWidth: 1
    property int metricRadius: 0

    // metric title theme
    property color metricTitleColor: 'black'
    property color metricTitleStyleColor: 'white'
    property real metricTitleOpacity: 0.7

    // metric value theme
    property color metricValueColor: 'black'
    property color metricValueStyleColor: 'white'
    property real metricValueOpacity: 0.6

    // ChangeIndicator theme
    property color changeIndicatorUpdateArrowColorize: 'grey'
    property color changeIndicatorValueColor: 'black'
    property color changeIndicatorValueStyleColor: 'white'
    property real changeIndicatorValueOpacity: 0.6

    // StarEmitter theme
    property int starEmitterParticleSize: 40
    property color starEmitterParticleColor: 'black'
    property real starEmitterParticleColorVariation: 0.3
    property real starEmitterParticleOpacity: 0.1
    property int starEmitterEmitRate: 2400
    property int starEmitterLifeSpan: 150
    property int starEmitterSwitchOffTime: 3000

    // BarGraph theme
    property Gradient barGraphGradient: Gradient {
        GradientStop { position: 0.0;    color: 'lightgray' }
        GradientStop { position: 0.5;    color: 'lightgray' }
        GradientStop { position: 1;    color: 'lightgray' }
    }
    property real barGraphOpacity: 0.9
    property int barGraphBorderWidth: 1
    property color barGraphBorderColor: 'black'
}
