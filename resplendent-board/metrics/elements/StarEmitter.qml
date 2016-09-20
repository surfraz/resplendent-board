import QtQuick 2.7
import QtQuick.Particles 2.0

// sends particles out into the distance

Item {
    property int parentOldZ
    property int starsSwitchOffTime: theme.starEmitterSwitchOffTime

    anchors.fill: parent

    // start particles
    function trigger() {
        parentOldZ = parent.z
        parent.z += 10
        particles.start()
        quieseEmitter.start()
        turnOffParticles.start()
    }

    ParticleSystem {
        id: particles
        running: false
    }

    ImageParticle {
        anchors.fill: parent
        system: particles
        source: 'qrc:///images/goldstar.png'
        alpha: 0.5
        opacity: theme.starEmitterParticleOpacity
        color: theme.starEmitterParticleColor
        colorVariation: theme.starEmitterParticleColorVariation
    }

    Emitter {
        id: starEmitter
        anchors.fill: parent
        system: particles
        emitRate: theme.starEmitterEmitRate
        lifeSpan: theme.starEmitterLifeSpan
        enabled: true
        size: theme.starEmitterParticleSize
        velocity: AngleDirection {
            angle: 0
            angleVariation: 360
            magnitude: 300
        }
    }

    // provides a smoother stop
    Timer {
        id: quieseEmitter
        interval: starsSwitchOffTime
        repeat: false
        running: false
        onTriggered: {
            starEmitter.emitRate = 0
        }
    }

    // allow time for emitted particles to live their lifespan
    Timer {
        id: turnOffParticles
        interval: starsSwitchOffTime + 1000
        repeat: false
        running: false
        onTriggered: {
            starEmitter.emitRate = theme.starEmitterEmitRate
            particles.reset()
            particles.running = false
            parent.z = parentOldZ
        }
    }
}
