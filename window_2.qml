pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import io.qt.controller 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Evaluación Qt 2")

    Controller {
        id: controller
    }

    Rectangle{
        width: parent.width
        height: 50
        anchors.centerIn: parent
        color: "lightblue"

        TextInput {
            text: "Text"
            anchors.centerIn: parent
            color: "darkblue"
            cursorVisible: false

            onEditingFinished:{
                // We need to call the maxValueChanged() signal
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
