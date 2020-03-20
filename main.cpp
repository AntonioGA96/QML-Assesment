#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
//#include <QtQml>

#include "controller.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    Controller controller;

//    qmlRegisterType<Controller>("io.qt.controller", 1, 0, "Controller");
//    qmlRegisterSingletonType(QUrl("qrc:/window_2.qml"),"Window2",1,0,"Window2");

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("Controller",&controller);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.load(QUrl(QStringLiteral("qrc:/other.qml")));
    if (engine.rootObjects().isEmpty())
            return -1;

    return app.exec();
}
