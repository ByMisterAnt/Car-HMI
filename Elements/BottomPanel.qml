import QtQuick 2.15

Item
{

    x: - this.width / 2

Row
{
    anchors.fill: parent

    y: parent.height / 2

    Image
    {
        id: fuelstation

        width: 20
        height: 20

        x: parent.width / 2 - this.width / 2


        source: "../images/fuel-station.png"
        fillMode: Image.PreserveAspectFit
    }

    Text
    {
        id: kilometers

        color: "#ffffff"
        text: qsTr("240 km")

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        leftPadding: 10
        font.pointSize: 10

    }
}
}

/*##^##
Designer {
    D{i:0;formeditorZoom:6}
}
##^##*/
