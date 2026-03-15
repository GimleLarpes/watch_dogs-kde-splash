 /*
    SPDX-FileCopyrightText: 2014 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2025 ferretwithaberet <andreiradoidev@gmail.com>
    SPDX-FileCopyrightText: 2026 Gimle Larpes <gimlelarpes@gmail.com>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#000"

    Item {
        id: content
        anchors.fill: parent
        opacity: 1
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Rectangle {

            property int sizeAnim: 704

            id: imageSource
            width:  sizeAnim
            height: sizeAnim
            color:  "transparent"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            clip: true;

            AnimatedImage {
                id: face
                source: "images/plasma_d.gif"
                paused: false
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width:  imageSource.sizeAnim
                height: imageSource.sizeAnim
                visible: true
            }
        }

        Image {
            id: busyIndicator
            //in the middle of the remaining space
            y: parent.height - 200
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: units.gridUnit
            source: "images/busywidget.svgz"
            sourceSize.height: units.gridUnit * 2
            sourceSize.width: units.gridUnit * 2
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 1500
                loops: Animation.Infinite
                running: true
            }
        }

    }
}
