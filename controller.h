#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QString>

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString myVar READ myVar WRITE setMyVar NOTIFY myVarChanged) // Verify MEMBER

public:
    explicit Controller(QObject *parent = nullptr);

    QString myVar();
    void setMyVar(const QString &myVar);

signals:
    void myVarChanged();

private:
    QString m_myVar;
};

#endif // CONTROLLER_H
