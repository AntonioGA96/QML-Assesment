//pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
//import io.qt.controller 1.0

Window {
    id: inputText
    visible: true
    width: 320
    height: 240
    x: (Screen.desktopAvailableWidth - width) / 2 + width/2
    y: (Screen.desktopAvailableHeight - height) / 2
    title: qsTr("inputText")
    color: "lightblue"



    Connections {
        target: Controller

        onCurrentValueChanged: {
            // Update ProgressBar currentValue
        }

        onMaxValueChanged: {
            //
        }
    }

    Rectangle{
        width: parent.width/2
        height: 50
        anchors.centerIn: parent
        color: "#e6e6e6"
        radius: 10

        TextInput {
            id: currentValueInput
            text: "10"
            anchors.centerIn: parent
            color: "darkblue"
            cursorVisible: false

            onEditingFinished:{
                Controller.currentValue = currentValueInput.text
            }
        }
    }

    Item{
        anchors.fill: parent
        focus: true
        Keys.onLeftPressed: {
            console.log("<---");
            controller.currentValue = 127
        }
        Keys.onRightPressed:
        {
            console.log("--->");
            console.log("Max value", controller.maxValue);
        }
    }
}
