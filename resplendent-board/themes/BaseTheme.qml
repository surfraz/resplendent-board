import QtQuick 2.7

// holds theme values for dashboard
// you can create your own sub-themes by
// inheriting this object and adding/overiding
// properties at will

Item {
    // title theme
    property color titleColor: 'white'

    // background theme
    property color backgroundTopGradientColor: 'black'
    property color backgroundBottomGradientColor: 'maroon'
    property bool backgroundAnimateGradient: true

    // metric box theme
    property color metricTopGradientColor: 'steelblue'
    property color metricBottomGradientColor: 'black'
    property color metricBorderColor: 'red'
    property int metricBorderWidth: 1
    property int metricRadius: 0

    // metric title theme
    property color metricTitleColor: 'white'
    property color metricTitleStyleColor: 'black'
    property real metricTitleOpacity: 0.9

    // metric value theme
    property color metricValueColor: 'yellow'
    property color metricValueStyleColor: 'black'
    property real metricValueOpacity: 1

    // ChangeIndicator theme
    property color changeIndicatorUpdateArrowColorize: 'transparent'
    property color changeIndicatorValueColor: 'yellow'
    property color changeIndicatorValueStyleColor: 'black'
    property real changeIndicatorValueOpacity: 1

    // StarEmitter theme
    property int starEmitterParticleSize: 40
    property color starEmitterParticleColor: 'blue'
    property real starEmitterParticleColorVariation: 1
    property real starEmitterParticleOpacity: 1
    property int starEmitterEmitRate: 800
    property int starEmitterLifeSpan: 100
    property int starEmitterSwitchOffTime: 3000

    // BarGraph theme
    property Gradient barGraphGradient: Gradient {
        GradientStop { position: 0.0;    color: 'crimson' }
        GradientStop { position: 0.5;    color: 'lightgray' }
        GradientStop { position: 1;    color: 'darkblue' }
    }
    property real barGraphOpacity: 0.9
    property int barGraphBorderWidth: 0
    property color barGraphBorderColor: 'white'
}
