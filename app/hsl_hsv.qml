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

    function hslToHex(h, s, l) {
        // Convert HSL to RGB
        var c = (1 - Math.abs(2 * l - 1)) * s;
        var x = c * (1 - Math.abs((h / 60) % 2 - 1));
        var m = l - c / 2;
        var r, g, b;
        if (h >= 0 && h < 60) {
            r = c;
            g = x;
            b = 0;
        } else if (h >= 60 && h < 120) {
            r = x;
            g = c;
            b = 0;
        } else if (h >= 120 && h < 180) {
            r = 0;
            g = c;
            b = x;
        } else if (h >= 180 && h < 240) {
            r = 0;
            g = x;
            b = c;
        } else if (h >= 240 && h < 300) {
            r = x;
            g = 0;
            b = c;
        } else {
            r = c;
            g = 0;
            b = x;
        }
        // Convert RGB to hexadecimal
        r = Math.round((r + m) * 255).toString(16).padStart(2, '0');
        g = Math.round((g + m) * 255).toString(16).padStart(2, '0');
        b = Math.round((b + m) * 255).toString(16).padStart(2, '0');
        return "#" + r + g + b;
    }

    function hsvToHex(h, s, v) {
        var c = v * s;
        var x = c * (1 - Math.abs((h / 60) % 2 - 1));
        var m = v - c;
        var r, g, b;
        if (h >= 0 && h < 60) {
            r = c;
            g = x;
            b = 0;
        } else if (h >= 60 && h < 120) {
            r = x;
            g = c;
            b = 0;
        } else if (h >= 120 && h < 180) {
            r = 0;
            g = c;
            b = x;
        } else if (h >= 180 && h < 240) {
            r = 0;
            g = x;
            b = c;
        } else if (h >= 240 && h < 300) {
            r = x;
            g = 0;
            b = c;
        } else {
            r = c;
            g = 0;
            b = x;
        }
        r = Math.round((r + m) * 255).toString(16).padStart(2, '0');
        g = Math.round((g + m) * 255).toString(16).padStart(2, '0');
        b = Math.round((b + m) * 255).toString(16).padStart(2, '0');
        return "#" + r + g + b;
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
            text: "Color Spaces : HSL / HSV"
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
            id: hsl_rect
            width: parent.width / 2 - 15
            height: parent.height / 2 - 50
            border.color: "black"
            border.width: 4
            radius: 8
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 10
            anchors.topMargin: 80
            anchors.rightMargin: 10
            Rectangle {
                id: hsl_clr_changer
                color: Qt.hsla(hue_slider.value / 360, saturation_slider.value / 100, light_slider.value / 100, 1)
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
                id: hsl_values
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
                    text: "hsl( H : " + hue_slider.value + " | S : " + saturation_slider.value + " | L : " + light_slider.value + ")\n\nHex : " + hslToHex(hue_slider.value, saturation_slider.value / 100, light_slider.value / 100) + ""
                    font.family: "Times"
                    font.bold: true
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    selectByMouse: true
                    readOnly: true
                }
            }
            Text {
                text: "HSL ( Hue , Saturation and Lightness ) "
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Times"
                font.bold: true
                color: Qt.hsla(hue_slider.value / 360, saturation_slider.value / 100, light_slider.value / 100, 1)
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
                id: all_hsl_sliders
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
                    id: hsl_sliders_Layout
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    spacing: 20
                    Slider {
                        id: hue_slider
                        from: 0
                        to: 360
                        stepSize: 1
                        value: hue_sb.displayText
                        background: Rectangle {
                            x: hue_slider.leftPadding
                            y: hue_slider.topPadding + hue_slider.availableHeight / 2 - height / 2
                            implicitWidth: 450
                            implicitHeight: 10
                            width: hue_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal // Set the orientation to horizontal
                                GradientStop {
                                    position: 0; color: "#ff0000"
                                }        // Red
                                GradientStop {
                                    position: 0.17; color: "#ffff00"
                                }     // Yellow
                                GradientStop {
                                    position: 0.33; color: "#00ff00"
                                }     // Green
                                GradientStop {
                                    position: 0.5; color: "#00ffff"
                                }      // Cyan
                                GradientStop {
                                    position: 0.67; color: "#0000ff"
                                }     // Blue
                                GradientStop {
                                    position: 0.83; color: "#ff00ff"
                                }     // Magenta
                                GradientStop {
                                    position: 1; color: "#ff0000"
                                }        // Red (again, to complete the loop)
                            }
                            Rectangle {
                                width: hue_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: hue_slider.leftPadding + hue_slider.visualPosition * (hue_slider.availableWidth - width)
                            y: hue_slider.topPadding + hue_slider.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: "white"
                            border.color: "black"
                        }
                    }
                    Slider {
                        id: saturation_slider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: saturation_sb.displayText
                        background: Rectangle {
                            x: saturation_slider.leftPadding
                            y: saturation_slider.topPadding + saturation_slider.availableHeight / 2 - height / 2
                            implicitWidth: 450
                            implicitHeight: 10
                            width: saturation_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "gray"
                                }
                                GradientStop {
                                    position: 1; color: Qt.hsva(hue_slider.value / 360, 100, 50, 1)
                                }
                            }
                            Rectangle {
                                width: saturation_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: saturation_slider.leftPadding + saturation_slider.visualPosition * (saturation_slider.availableWidth - width)
                            y: saturation_slider.topPadding + saturation_slider.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: "white"
                            border.color: "black"
                        }
                    }
                    Slider {
                        id: light_slider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: light_sb.displayText
                        background: Rectangle {
                            x: light_slider.leftPadding
                            y: light_slider.topPadding + light_slider.availableHeight / 2 - height / 2
                            implicitWidth: 450
                            implicitHeight: 10
                            width: light_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "black"
                                }
                                GradientStop {
                                    position: 0.5; color: Qt.hsva(hue_slider.value / 360, 100, 50, 1)
                                }
                                GradientStop {
                                    position: 1; color: Qt.hsva(hue_slider.value / 360, 0, 50, 1)
                                }
                            }
                            Rectangle {
                                width: light_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: light_slider.leftPadding + light_slider.visualPosition * (light_slider.availableWidth - width)
                            y: light_slider.topPadding + light_slider.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: "white"
                            border.color: "black"
                        }
                    }
                }
                ColumnLayout {
                    id: hsl_txt_Layout
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    spacing: 20
                    Text {
                        text: "Hue :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Saturation :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Lightness :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                }
                ColumnLayout {
                    id: hsl_sb_Layout
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 145
                    spacing: 20
                    SpinBox {
                        id: hue_sb
                        editable: true
                        width: 300
                        from:0
                        value: hue_slider.value
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
                    SpinBox {
                        editable: true
                        id: saturation_sb
                        width: 300
                        from:0
                        value: saturation_slider.value
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
                        id: light_sb
                        editable: true
                        width: 300
                        from:0
                        value: light_slider.value
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
                }
            }
        }
        Rectangle {
            id: hsv_rect
            width: parent.width / 2 - 15
            height: parent.height / 2 - 50
            border.color: "black"
            border.width: 4
            radius: 8
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 10
            anchors.topMargin: 80
            anchors.leftMargin: 10
            Rectangle {
                id: hsv_clr_changer
                color: Qt.hsva(hue_slider1.value / 360, saturation_slider1.value / 100, value_slider.value / 100, 1)
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
                id: hsv_values
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
                    text: "hsl( H : " + hue_slider1.value + " | S : " + saturation_slider1.value + " | L : " + value_slider.value + ")\n\nHex : " + hsvToHex(hue_slider1.value, saturation_slider1.value / 100, value_slider.value / 100) + ""
                    font.family: "Times"
                    font.bold: true
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    selectByMouse: true
                    readOnly: true
                }
            }
            Text {
                text: "HSV ( Hue , Saturation and Value ) "
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Times"
                font.bold: true
                color: Qt.hsla(hue_slider1.value / 360, saturation_slider1.value / 100, value_slider.value / 100, 1)
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
                id: all_hsv_sliders
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
                    id: hsv_sliders_Layout
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    spacing: 20
                    Slider {
                        id: hue_slider1
                        from: 0
                        to: 360
                        stepSize: 1
                        value: hue_sb1.displayText
                        background: Rectangle {
                            x: hue_slider1.leftPadding
                            y: hue_slider1.topPadding + hue_slider1.availableHeight / 2 - height / 2
                            implicitWidth: 450
                            implicitHeight: 10
                            width: hue_slider1.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal // Set the orientation to horizontal
                                GradientStop {
                                    position: 0; color: "#ff0000"
                                }        // Red
                                GradientStop {
                                    position: 0.17; color: "#ffff00"
                                }     // Yellow
                                GradientStop {
                                    position: 0.33; color: "#00ff00"
                                }     // Green
                                GradientStop {
                                    position: 0.5; color: "#00ffff"
                                }      // Cyan
                                GradientStop {
                                    position: 0.67; color: "#0000ff"
                                }     // Blue
                                GradientStop {
                                    position: 0.83; color: "#ff00ff"
                                }     // Magenta
                                GradientStop {
                                    position: 1; color: "#ff0000"
                                }        // Red (again, to complete the loop)
                            }
                            Rectangle {
                                width: hue_slider1.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: hue_slider1.leftPadding + hue_slider1.visualPosition * (hue_slider1.availableWidth - width)
                            y: hue_slider1.topPadding + hue_slider1.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: "white"
                            border.color: "black"
                        }
                    }
                    Slider {
                        id: saturation_slider1
                        from: 0
                        to: 100
                        stepSize: 1
                        value: saturation_sb1.displayText
                        background: Rectangle {
                            x: saturation_slider1.leftPadding
                            y: saturation_slider1.topPadding + saturation_slider1.availableHeight / 2 - height / 2
                            implicitWidth: 450
                            implicitHeight: 10
                            width: saturation_slider1.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "white"
                                }
                                GradientStop {
                                    position: 1; color: Qt.hsva(hue_slider1.value / 360, 100, 50, 1)
                                }
                            }
                            Rectangle {
                                width: saturation_slider1.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: saturation_slider1.leftPadding + saturation_slider1.visualPosition * (saturation_slider1.availableWidth - width)
                            y: saturation_slider1.topPadding + saturation_slider1.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: "white"
                            border.color: "black"
                        }
                    }
                    Slider {
                        id: value_slider
                        from: 0
                        to: 100
                        stepSize: 1
                        value: value_sb1.displayText
                        background: Rectangle {
                            x: value_slider.leftPadding
                            y: value_slider.topPadding + value_slider.availableHeight / 2 - height / 2
                            implicitWidth: 450
                            implicitHeight: 10
                            width: value_slider.availableWidth
                            height: implicitHeight
                            radius: 2
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0; color: "black"
                                }
                                GradientStop {
                                    position: 1; color: Qt.hsva(hue_slider1.value / 360, 100, 50, 1)
                                }
                            }
                            Rectangle {
                                width: value_slider.visualPosition * parent.width
                                height: parent.height
                                color: "transparent"
                                radius: 2
                            }
                        }
                        handle: Rectangle {
                            x: value_slider.leftPadding + value_slider.visualPosition * (value_slider.availableWidth - width)
                            y: value_slider.topPadding + value_slider.availableHeight / 2 - height / 2
                            implicitWidth: 26
                            implicitHeight: 26
                            radius: 13
                            color: "white"
                            border.color: "black"
                        }
                    }
                }
                ColumnLayout {
                    id: hsv_txt_Layout
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    spacing: 20
                    Text {
                        text: "Hue :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Saturation :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                    Text {
                        text: "Value :"
                        color: "black"
                        font.family: "Times"
                        font.bold: true
                        font.pixelSize: 20
                    }
                }
                ColumnLayout {
                    id: hsv_sb_Layout
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 145
                    spacing: 20
                    SpinBox {
                        id: hue_sb1
                        editable: true
                        width: 300
                        from:0
                        value: hue_slider1.value
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
                    SpinBox {
                        editable: true
                        id: saturation_sb1
                        width: 300
                        from:0
                        value: saturation_slider1.value
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
                        id: value_sb1
                        editable: true
                        width: 300
                        from:0
                        value: value_slider.value
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
                }
            }
        }
    }
}