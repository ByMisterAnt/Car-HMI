import QtQuick 2.15

Item
{
    id: item1

    property double item_width: 150
    property double item_height: 150

    property double speed_angle: 0

    property int speed_value: 0

    property string speed_type: "km/h"

    width: item_width
    height: item_height


    Image
    {
        id: speedometr

        x: 0
        y: 0


        source: "../images/speedometr.png"

        fillMode: Image.PreserveAspectFit

        anchors.fill: parent

        transformOrigin: Item.bottom
        rotation: item1.speed_angle

    }


    Text
    {
        id: speedText

        text: speed_value
        anchors.verticalCenter: parent.verticalCenter

        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        bottomPadding: 20
        fontSizeMode: Text.VerticalFit

        font.pointSize: 33
        minimumPointSize: 22

        color: "white"



    }

    Text
    {
        id: speedType

        text: speed_type

        y: parent.height/2 + speedText.height/4 //- 10
        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.VerticalFit

        font.pointSize: 10
        minimumPointSize: 10

        color: "white"



    }




}


/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
