#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QString>
#include <QTimer>
#include <QDebug>

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString myVar READ myVar WRITE setMyVar NOTIFY myVarChanged) // Verify MEMBER
    Q_PROPERTY(int currentValue READ currentValue WRITE setCurrentValue NOTIFY currentValueChanged)
    Q_PROPERTY(int maxValue READ maxValue WRITE setMaxValue NOTIFY maxValueChanged)

public:
    QTimer *m_timer;
    explicit Controller(QObject *parent = nullptr);

    QString myVar();
    void setMyVar(const QString &myVar);

    int currentValue();
    void setCurrentValue(const int &currentValue);

    int maxValue();
    void setMaxValue(const int &maxValue);

signals:
    void myVarChanged();
    void currentValueChanged();
    void maxValueChanged();


public slots:
    void startProgress();
    void stopProgress();
    void myTimerSlot();

private:
    QString m_myVar;
    int m_currentValue;
    int m_maxValue;
};

#endif // CONTROLLER_H
