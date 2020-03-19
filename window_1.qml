import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import io.qt.controller 1.0

Window {
    id: window
    visible: true
    width: 320
    height: 240
    title: qsTr("Progress Bar")
    color: "lightblue"

    Controller {
        id: controller
        Component.onCompleted: {
            controller.currentValue = 0
            controller.maxValue = 10
        }
    }

    ProgressBar {
        id: control
        from: 0
        to: 100
        value: controller.currentValue
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
            controller.startProgress()
//            controller.currentValue -= 1
//            console.log("Value: ", controller.currentValue);
//            bar.value = controller.currentValue
        }
        Keys.onRightPressed:
        {
            controller.stopProgress()
//            controller.currentValue += 1
//            console.log("Value: ", controller.currentValue);
//            bar.value = controller.currentValue
        }
    }
}
