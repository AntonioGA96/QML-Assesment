import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: progressBar
    visible: true
    width: 320
    height: 240
    x: (Screen.desktopAvailableWidth - width) / 2 - width/2
    y: (Screen.desktopAvailableHeight - height) / 2
    title: qsTr("progressBar")
    color: "lightblue"

    Connections {
        target: Controller

        onCurrentValueChanged: {
            control.value = currentValue
        }
    }

    ProgressBar {
        id: control
        from: 0
        to: Controller.maxValue
        value: Controller.currentValue
        padding: 2
        anchors.centerIn: parent

        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 50
            color: "#e6e6e6"
            radius: 10
        }

        contentItem: Item {
            implicitWidth: 200
            implicitHeight: 50

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                radius: 8
                color: "#17a81a"
            }
        }
    }

    Item{
        focus: true
        Keys.onLeftPressed: {
            Controller.startProgress()
        }
        Keys.onRightPressed:
        {
            Controller.stopProgress()
        }
    }
}
