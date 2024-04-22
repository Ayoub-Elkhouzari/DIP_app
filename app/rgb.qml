import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Window {
    width: Screen.desktopAvailableWidth + 10
    height: Screen.desktopAvailableHeight + 10
    visible: true
    title: "Color Spaces "

    function rgbaToHex(r, g, b) {
        return "#" + ("00" + Math.round(r * 255).toString(16)).slice(-2) + ("00" + Math.round(g * 255).toString(16)).slice(-2) + ("00" + Math.round(b * 255).toString(16)).slice(-2)
    }

    Rectangle {
        id: m
        width: parent.width - 10
        height: parent.height - 10
        border.color: "black"
        border.width: 4
        radius: 8
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 10
        Text {
            textFormat: Text.RichText // Set text format to rich text
            text: "Color Spaces : <font color='red'>R</font><font color='green'>G</font><font color='blue'>B</font>"
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Times"
            font.bold: true
            font.pixelSize: 30
            anchors.top: parent.top
            anchors.topMargin: 20
            SequentialAnimation on opacity {
                NumberAnimation {
                    to: 0.0; duration: 500
                }
                NumberAnimation {
                    to: 1.0; duration: 500
                }
                loops: Animation.Infinite
            }
        }

        Rectangle {
            id: rgb_rect
            width: parent.width - 20
            height: parent.height - 100
            border.color: "black"
            border.width: 4
            radius: 8
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 10
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10

            Rectangle {
                id: rbg_clr_changer
                color: Qt.rgba(red_slider.value / 255, green_slider.value / 255, blue_slider.value / 255, 1)
                width: parent.width / 2 - 20
                height: parent.height / 2 - 70
                border.width: 4
                radius: 8
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 50
                anchors.leftMargin: 14
            }
            Rectangle {
                id: rgb_values
                width: parent.width / 2 - 20
                height: parent.height / 2 - 70
                border.color: "black"
                border.width: 4
                radius: 8
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 50
                anchors.rightMargin: 14
                TextEdit {
                    wrapMode: Text.WordWrap
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "rgb( R : " + red_slider.value + " | G : " + green_slider.value + "|B : " + blue_slider.value + ")\n\nHex : " + rgbaToHex(red_slider.value / 255, green_slider.value / 255, blue_slider.value / 255) + ""
                    font.family: "Times"
                    font.bold: true
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    selectByMouse: true
                    readOnly: true
                }
            }
            Text {
                textFormat: Text.RichText // Set text format to rich text
                // textFormat: Text.RichText // Set text format to rich text
            // text: "Color Spaces : <font color='red'>R</font><font color='green'>G</font><font color='blue'>B</font>"
                text: "<font color='red'>R</font><font color='green'>G</font><font color='blue'>B ( </font><font color='red'>Red</font><font color='green'>,Green </font>and<font color='blue'> Blue )</font>"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Times"
                font.bold: true
                font.pixelSize: 20
                anchors.top: parent.top
                anchors.topMargin: 15
                SequentialAnimation on opacity {
                    NumberAnimation {
                        to: 0.0; duration: 500
                    }
                    NumberAnimation {
                        to: 1.0; duration: 500
                    }
                    loops: Animation.Infinite
                }
            }
            Rectangle {
                id: all_rgb_sliders
                width: parent.width - 20
                height: parent.height / 2
                color: "white"
                border.color: "black"
                border.width: 4
                radius: 8
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                ColumnLayout {
                    id: slidersLayout
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    spacing: 20
                    Slider {
                        id: red_slider
                        from: 0
                        to: 255
                        stepSize: 1
                        value: red_sb.displayText
                        background: Rectangle {
                            x: red_slider.leftPadding
                            y: red_slider.topPadding + red_slider.availableHeight / 2 - height / 2
                            implicitWidth: 1200
                            implicitHeight: 10
                            width: red_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            color: "red"
                            Rectangle {
                                width: red_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: red_slider.leftPadding + red_slider.visualPosition * (red_slider.availableWidth - width)
                            y: red_slider.topPadding + red_slider.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: red_slider.pressed ? "red" : "white"
                            border.color: "red"
                        }
                    }
                    Slider {
                        id: green_slider
                        from: 0
                        to: 255
                        stepSize: 1
                        value: green_sb.displayText
                        background: Rectangle {
                            x: green_slider.leftPadding
                            y: green_slider.topPadding + green_slider.availableHeight / 2 - height / 2
                            implicitWidth: 1200
                            implicitHeight: 10
                            width: green_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            color: "green"
                            Rectangle {
                                width: green_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: green_slider.leftPadding + green_slider.visualPosition * (green_slider.availableWidth - width)
                            y: green_slider.topPadding + green_slider.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: green_slider.pressed ? "green" : "white"
                            border.color: "green"
                        }
                    }
                    Slider {
                        id: blue_slider
                        from: 0
                        to: 255
                        stepSize: 1
                        value: blue_sb.displayText
                        background: Rectangle {
                            x: blue_slider.leftPadding
                            y: blue_slider.topPadding + blue_slider.availableHeight / 2 - height / 2
                            implicitWidth: 1200
                            implicitHeight: 10
                            width: blue_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            color: "blue"
                            Rectangle {
                                width: blue_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: blue_slider.leftPadding + blue_slider.visualPosition * (blue_slider.availableWidth - width)
                            y: blue_slider.topPadding + blue_slider.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: blue_slider.pressed ? "blue" : "white"
                            border.color: "blue"
                        }
                    }
                }
                ColumnLayout {
                    id: slidersLayout1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20

                    spacing: 20
                    Text {
                        text: "Red :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Green :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Blue :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                }
                ColumnLayout {
                    id: slidersLayout11
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 130

                    spacing: 20
                    SpinBox {
                        id: red_sb
                        editable: true
                        width: 300
                        from:0
                        value: red_slider.value
                        to: 255
                        stepSize: 1
                        background: Rectangle {
                            implicitWidth: 70
                            implicitHeight: 30
                            border.width: 4
                            radius: 5
                            color: "red"
                        }
                    }
                    SpinBox {
                        id: green_sb
                        editable: true
                        width: 300
                        from:0
                        value: green_slider.value
                        to: 255
                        stepSize: 1
                        background: Rectangle {
                            implicitWidth: 70
                            implicitHeight: 30
                            border.width: 4
                            radius: 5
                            color: "red"
                        }
                    }
                    SpinBox {
                        editable: true
                        id: blue_sb
                        width: 300
                        from:0
                        value: blue_slider.value
                        to: 255
                        stepSize: 1
                        background: Rectangle {
                            implicitWidth: 70
                            implicitHeight: 30
                            border.width: 4
                            radius: 5
                            color: "red"
                        }
                    }
                }
            }
        }
    }
}