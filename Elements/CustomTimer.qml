import QtQuick 2.15

Item
{
    Timer
    {
        interval: 500; running: true; repeat: true
        onTriggered: time.text = new Date().toTimeString()
    }

    Text
    {
        id: time

        x: -this.width / 2

        text: "What's time is it"

        font.family: "Arial"
        color: "white"

        font.pointSize: 10
        fontSizeMode: Text.Fit
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.66;height:480;width:640}
}
##^##*/
