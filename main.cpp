#include "mainwindow.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <QScriptEngine>

int main(int argc, char *argv[])
{
    QApplication  app(argc, argv);
    app.setOrganizationName("pdrl");
    app.setOrganizationDomain("https://github.com/8-DK");
    QQmlApplicationEngine engine;
    qmlRegisterType<MainWindow>("MainWindowLib", 1, 0, "MainWindow");


    engine.load(QUrl(QStringLiteral("qrc:/stackView.qml")));
    // engine.load(QUrl(QStringLiteral("qrc:/.qml")));

    return app.exec();
}
