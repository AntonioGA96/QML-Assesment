#include <QTimer>
#include <QDebug>
#include "controller.h"

Controller::Controller(QObject *parent) : QObject(parent),
    m_currentValue(0),
    m_maxValue(100)
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
    emit currentValueChanged(m_currentValue);
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
    connect(m_timer, &QTimer::timeout,[=](){
        if(m_currentValue < m_maxValue){
            ++m_currentValue;
            emit currentValueChanged(m_currentValue);
        }
    });
    m_timer->start(1000);
}

//void Controller::startProgress(const QColor &color)
//{

//}

void Controller::stopProgress()
{
    m_timer->stop();
    // Fill the rest of the ProgressBar in 3 seconds (3000 ms)
    int step = 3000 / (m_maxValue - m_currentValue);
    connect(m_timer, &QTimer::timeout,[=](){
        if(m_currentValue < m_maxValue){
            ++m_currentValue;
            emit currentValueChanged(m_currentValue);
        }
    });
    m_timer->start(step);
}

void Controller::myTimerSlot()
{
    qDebug() << "Timer...";
    if(m_currentValue < m_maxValue){
        m_currentValue += 1;
        setCurrentValue(m_currentValue);
    }
    else
        stopProgress();
    qDebug() << m_currentValue;
}

