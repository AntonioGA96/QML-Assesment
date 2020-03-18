#include "controller.h"

Controller::Controller(QObject *parent) :
    QObject(parent)
{
}

QString Controller::myVar()
{
    return m_myVar;
}

void Controller::setMyVar(const QString &myVar)
{
    if(myVar == m_myVar)
        return;

    m_myVar = myVar;
    emit myVarChanged();
}
