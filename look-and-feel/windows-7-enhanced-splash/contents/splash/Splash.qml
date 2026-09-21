import QtQuick

Rectangle {
    width: 1920
    height: 1080

    Image {
        anchors.fill: parent
        source: "images/bg.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    Text {
        text: "Welcome"
        anchors.centerIn: parent
        font.family: "Tahoma"
        font.pointSize: 24
        color: "white"
    }

    AnimatedImage {
        source: "images/aerobusy.webp"
        width: 38
        height: 38
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 40
    }
}
