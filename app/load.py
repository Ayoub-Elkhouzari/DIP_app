from PyQt6.QtGui import QIcon
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtCore import QObject, pyqtSlot, QUrl, pyqtSignal
from PyQt6.QtWidgets import QApplication, QVBoxLayout, QWidget
import sys


class Window(QObject):
    plotGenerated = pyqtSignal(str)  # Signal to emit plot data

    def __init__(self):
        super().__init__()


if __name__ == "__main__":
    app = QApplication(sys.argv)

    app.setWindowIcon(QIcon("icon.png"))

    engine = QQmlApplicationEngine()

    window = Window()

    engine.rootContext().setContextProperty('window', window)

    engine.load(QUrl.fromLocalFile('rgb.qml'))

    sys.exit(app.exec())
