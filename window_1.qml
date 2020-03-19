import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import io.qt.controller 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Slider")

    //Crear Widget Progressbar en QML.
    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        color: "lightgray"

        Rectangle {
            id: fill
            width: 400
            height: 50
            color: "gray"
            anchors.centerIn: parent

            Controller {
                id: controller
            }

            // Add the progress bar
            ProgressBar {
                id: bar
                width: parent.width
                height: 50
                from: 0
                to: controller.maxValue = 255
                value: controller.currentValue = 127

                onValueChanged: {

                }
            }
        }

        Item{
            anchors.fill: parent
            focus: true
            Keys.onLeftPressed: {
//                controller.currentValue -= 1
//                console.log("Value: ", controller.currentValue);
//                bar.value = controller.currentValue
                controller.startProgress()
            }
            Keys.onRightPressed:
            {
                controller.stopProgress()
                /*controller.currentValue += 1
                console.log("Value: ", controller.currentValue);
                bar.value = controller.curre*/ntValue
            }
        }
    }
}
