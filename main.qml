import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import "./Elements"

import QtQuick3D 1.15
import QtStudio3D.OpenGL 2.5

Window {
    id: window

    width: 1280
    height: 720

    visible: true
    color: "#000000"
    title: qsTr("Car HMI")

    property double leftRot: 0

//Slider{
//    from:0
//    to: 360
//    onValueChanged: window.leftRot = value
//}

    Image
    {
        id: dash
        x: 102
        y: 189

        source: "images/dash.png"
        clip: true
        anchors.margins: 10

        fillMode: Image.PreserveAspectFit

        anchors.fill: parent

    }

    CustomTimer
    {
        id: timerPanel

        x: parent.width / 2

        y: dash.height / 2 - dash.height / 5
    }

    Speedometer
    {
        id: left_speedometer

        item_width: dash.height > 640 ? dash.height * 0.52 : dash.height * 0.4
        item_height: dash.height > 640 ? dash.height * 0.52 : dash.height * 0.4

        speed_angle: window.leftRot
        speed_value: window.leftRot

        visible: true

        anchors.verticalCenter: parent.verticalCenter

        x: dash.height > 640 ? dash.width * 0.22 - left_speedometer.width / 2 : dash.width * 0.235 - left_speedometer.width / 2
        y: dash.height / 2 - dash.height / 6

        speed_type: "km/h"
    }

    Speedometer
    {
        id: right_speedometer

        item_width: dash.height > 640 ? dash.height * 0.52 : dash.height * 0.4
        item_height: dash.height > 640 ? dash.height * 0.52 : dash.height * 0.4

        speed_angle: window.leftRot
        speed_value: window.leftRot

        visible: true

        anchors.verticalCenter: parent.verticalCenter

        x: dash.width  * 0.8 - right_speedometer.width / 2
        y: dash.height / 2 - dash.height / 6

        speed_type: "rpm x 1000"

    }

    BottomPanel
    {
        width: 40
        height: 30

        x: timerPanel.x- this.width
        y: dash.height * 0.75 - this.height
    }

    //------------------------------ Studio3D content ---------------------------------
    Item
    {
        id: studio3dArea

        /* Android
        width: dash.height > 640 ? dash.height * 0.52 : dash.height * 0.7 - 2
        height: dash.height > 640 ? dash.height * 0.52 / 2 : dash.height * 0.7 / 2
        */

        width: dash.height > 640 ? dash.height * 0.52 : dash.height * 0.4 - 20
        height: dash.height > 640 ? dash.height * 0.52 / 2 : dash.height * 0.4 / 2

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Custom3dStudio
        {
            presentation_path: "qrc:/CarView/CarView.uia"
        }
    }
    //------------------------------ end of Studio3D content --------------------------

    //------------------------------ Animation component ------------------------------

    // speed animation
    Component.onCompleted:  SequentialAnimation
    {
        ParallelAnimation
        {
            NumberAnimation
            {
                id: theAnimR;

                target: right_speedometer;

                properties: "speed_value, speed_angle";

                from: 0;
                to: 270;

                duration: 1000;
            }

            NumberAnimation
            {
                id: theAnimL;

                target: left_speedometer;

                properties: "speed_value, speed_angle";

                from: 0;
                to: 270;

                duration: 1000;
            }
        }

        ParallelAnimation
        {
            NumberAnimation
            {
                id: theAnimReverceR;

                target: right_speedometer;

                properties: "speed_value, speed_angle";

                from: 270;
                to: 0;

                duration: 1000;
            }

            NumberAnimation
            {
                id: theAnimReverceL;

                target: left_speedometer;

                properties: "speed_value, speed_angle";

                from: 270;
                to: 0;

                duration: 1000;
            }
        }
    }
    //------------------------------ end of Animation component -----------------------

}



/*##^##
Designer {
    D{i:0;formeditorZoom:16}
}
##^##*/
