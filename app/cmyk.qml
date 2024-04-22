import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Window {
    width: Screen.desktopAvailableWidth + 10
    height: Screen.desktopAvailableHeight + 10
    visible: true
    title: "Color Spaces "

    function cmykToHex(c, m, y, k) {
        // Convert CMYK to RGB
        var r = 255 * (1 - c) * (1 - k);
        var g = 255 * (1 - m) * (1 - k);
        var b = 255 * (1 - y) * (1 - k);

        // Convert RGB to hexadecimal
        return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
    }

    function componentToHex(c) {
        var hex = Math.round(c).toString(16);
        return hex.length == 1 ? "0" + hex : hex;
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
            text: "Color Spaces : <font color='#00ffff'>C</font><font color='#ff00ff'>M</font><font color='yellow'>Y</font><font color='black'>K</font>"
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
            id: cmyk_rect
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
                id: cmyk_clr_changer
                color: cmykToHex(cyan_slider.value / 100, magneta_slider.value / 100, yellow_slider.value / 100, black_slider.value / 100)
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
                id: cmyk_values
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
                    text: "cmyk( C : " + cyan_slider.value + " | M : " + magneta_slider.value + " | Y : " + yellow_slider.value + " | K : " + black_slider.value + ")\n\nHex : " + cmykToHex(cyan_slider.value / 100, magneta_slider.value / 100, yellow_slider.value / 100, black_slider.value / 100) + ""
                    font.family: "Times"
                    font.bold: true
                    font.pixelSize: 32
                    anchors.centerIn: parent
                    selectByMouse: true
                    readOnly: true
                }
            }
            Text {
                text: "CMYK ( Cyan, Magneta, Yellow , and Black ) "
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Times"
                font.bold: true
                color: cmykToHex(cyan_slider.value / 100, magneta_slider.value / 100, yellow_slider.value / 100, black_slider.value / 100)
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
                id: all_cmyk_sliders
                width: parent.width - 20
                height: parent.height /2
                color: "white"
                border.color: "black"
                border.width: 4
                radius: 8
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                ColumnLayout {
                    id: cmyk_sliders_Layout
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    spacing: 45
                    Slider {
                        id: cyan_slider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: cyan_sb.displayText
                        background: Rectangle {
                            x: cyan_slider.leftPadding
                            y: cyan_slider.topPadding + cyan_slider.availableHeight / 2 - height / 2
                            implicitWidth: 1200
                            implicitHeight: 10
                            width: cyan_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "white"
                                }
                                GradientStop {
                                    position: 1; color: "#00ffff"
                                }
                            }
                            Rectangle {
                                width: cyan_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: cyan_slider.leftPadding + cyan_slider.visualPosition * (cyan_slider.availableWidth - width)
                            y: cyan_slider.topPadding + cyan_slider.availableHeight / 2 - height / 2
                            implicitWidth: 20
                            implicitHeight: 20
                            radius: 13
                            color: "#00ffff"
                            border.color: "black"
                        }
                    }
                    Slider {
                        id: magneta_slider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: magneta_sb.displayText
                        background: Rectangle {
                            x: magneta_slider.leftPadding
                            y: magneta_slider.topPadding + magneta_slider.availableHeight / 2 - height / 2
                            implicitWidth: 1200
                            implicitHeight: 10
                            width: magneta_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "white"
                                }
                                GradientStop {
                                    position: 1; color: "#ff00ff"
                                }
                            }
                            Rectangle {
                                width: magneta_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: magneta_slider.leftPadding + magneta_slider.visualPosition * (magneta_slider.availableWidth - width)
                            y: magneta_slider.topPadding + magneta_slider.availableHeight / 2 - height / 2
                            implicitWidth: 20
                            implicitHeight: 20
                            radius: 13
                            color: "#ff00ff"
                            border.color: "black"
                        }
                    }
                    Slider {
                        id: yellow_slider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: yellow_sb.displayText
                        background: Rectangle {
                            x: yellow_slider.leftPadding
                            y: yellow_slider.topPadding + yellow_slider.availableHeight / 2 - height / 2
                            implicitWidth: 1200
                            implicitHeight: 10
                            width: yellow_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "white"
                                }
                                GradientStop {
                                    position: 1; color: "#ffff00"
                                }
                            }
                            Rectangle {
                                width: yellow_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: yellow_slider.leftPadding + yellow_slider.visualPosition * (yellow_slider.availableWidth - width)
                            y: yellow_slider.topPadding + yellow_slider.availableHeight / 2 - height / 2
                            implicitWidth: 20
                            implicitHeight: 20
                            radius: 13
                            color: "yellow"
                            border.color: "black"
                        }
                    }
                    Slider {
                        id: black_slider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: black_sb.displayText
                        background: Rectangle {
                            x: black_slider.leftPadding
                            y: black_slider.topPadding + black_slider.availableHeight / 2 - height / 2
                            implicitWidth: 1200
                            implicitHeight: 10
                            width: black_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "white"
                                }
                                GradientStop {
                                    position: 1; color: "#000000"
                                }
                            }
                            Rectangle {
                                width: black_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: black_slider.leftPadding + black_slider.visualPosition * (black_slider.availableWidth - width)
                            y: black_slider.topPadding + black_slider.availableHeight / 2 - height / 2
                            implicitWidth: 20
                            implicitHeight: 20
                            radius: 13
                            color: "black"
                            border.color: "black"
                        }
                    }
                }
                ColumnLayout {
                    id: cmyk_txt_Layout
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    spacing: 40
                    Text {
                        text: "Cyan :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Magneta :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Yellow :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Black :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                }
                ColumnLayout {
                    id: cmyk_sb_Layout
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 130
                    spacing: 35
                    SpinBox {
                        id: cyan_sb
                        editable: true
                        width: 300
                        from:0
                        value: cyan_slider.value
                        to: 100
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
                        id: magneta_sb
                        width: 300
                        from:0
                        value: magneta_slider.value
                        to: 100
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
                        id: yellow_sb
                        editable: true
                        width: 300
                        from:0
                        value: yellow_slider.value
                        to: 100
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
                        id: black_sb
                        editable: true
                        width: 300
                        from:0
                        value: black_slider.value
                        to: 360
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