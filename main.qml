import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import io.qt.controller 1.0


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Evaluación Qt")

    //Crear Widget Progressbar en QML.
    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        color: "lightgray"

        Rectangle {
            id: fill
            width: 400
            height: 200
            color: "gray"
            anchors.centerIn: parent
            // Margin

            // Add the progress bar
            ProgressBar {
                anchors.centerIn: parent
                from: 0
                to: 255
                value: 127
            }

        }
    }
}
