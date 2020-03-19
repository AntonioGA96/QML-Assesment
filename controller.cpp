#include <QTimer>
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

int Controller::currentValue()
{
    return m_currentValue;
}

void Controller::setCurrentValue(const int &currentValue)
{
    if(currentValue == m_currentValue)
        return;

    m_currentValue = currentValue;
    emit currentValueChanged();
}
int Controller::maxValue()
{
    return m_maxValue;
}

void Controller::setMaxValue(const int &maxValue)
{
    if(maxValue == m_maxValue)
        return;

    m_maxValue = maxValue;
    emit maxValueChanged();
}

void Controller::startProgress()
{
    m_timer = new QTimer(this);
    // Use connect and lambdas
    connect(m_timer, SIGNAL(timeout()), this, SLOT(myTimerSlot()));
    //connect(m_timer,)
    m_timer->start(1000);
}

void Controller::stopProgress()
{
    m_timer->stop();
}

void Controller::myTimerSlot()
{
    qDebug() << "Timer...";
    m_currentValue += 1;
    emit currentValue();
}

