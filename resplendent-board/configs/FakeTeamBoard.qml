import QtQuick 2.7
import "qrc:///metrics/"

// this should be imported into main and given the id of "config"

Grid {
    // team specific properties
    readonly property string boardTitle: 'Tax Team - Key Performance Indicators - Near realtime metrics board'
    readonly property string graphiteBaseURL: 'https://graphite-skyscape-farnborough-production.tax.service.gov.uk/render/?'

    spacing: 10
    columns: Math.floor((application.width - 30) / application.metricSizeWidth)
    leftPadding: (root.width - childrenRect.width) / 2
    width: parent.width
    height: parent.height

    // team metrics go here
    FakeMetric {
        title: "Total Completed Submissions"
        min: 100000; max: 1000000
    }

    FakeMetric {
        title: "Total Abandoned Submissions"
        min: 200000; max: 10000000
    }

    FakeMetric {
        title: "Total Individual Vistors"
        min: 1000000; max: 10000000
    }

    FakeMetric {
        title: "Tax Submissions Today"
        min: 1000; max: 4000
    }

    FakeMetric {
        title: "Tax Calculations Failed Today"
        min: 100; max: 300
    }

    FakeMetric {
        title: "Total Tax Evasion Attempts Today"
        min: 10; max: 256
    }

    FakeMetric {
        title: "Total Late Tax Payments Today"
        min: 30; max: 3000
    }

    FakeMetric {
        title: "Tax Evasion Criticality Karma %"
        min: 1; max: 100
        risingSeries: false
    }

    FakeMetric {
        title: "Overseas Tax Evasions Quashed Today"
        min: 10; max: 1000
    }

    FakeMetric {
        title: "Tax Submissions Facebook Likes Today"
        min: 3; max: 300
    }

    FakeMetric {
        title: "Fake Non-Doms Banged-Up Today"
        min: 3; max: 90
    }

    FakeMetric {
        title: "Total Chariteable Tax Relief Submissions Today"
        min: 3; max: 900
    }

    FakeMetric {
        title: "Blank Cheques Cashed by Politicians Today"
        min: 3; max: 900
    }

    FakeMetric {
        title: "Totally-fake Submissions Received Today"
        min: 3; max: 90
    }

    FakeMetric {
        title: "Ex-celebrity Posing as Celebrity Submissions Today"
        min: 3; max: 900
    }

    FakeMetric {
        title: "Tax Submissions Site Survey Happiness Index - Adjusted"
        min: 3; max: 80
        risingSeries: false
    }

    FakeMetric {
        title: "Total Taxeable-below-the-ground Submissions Today"
        min: 3; max: 900
    }

    FakeMetric {
        title: "Total MegaCorp CEO Submissions Today"
        min: 3; max: 900
    }
}
