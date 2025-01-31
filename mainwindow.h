#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QMainWindow>

#include <QObject>
#include <QDebug>
#include <QCryptographicHash>
#include <QRegularExpression>
#include <QScriptEngine>
enum  UnitDistance {
       Meter,
       Feet
   };
enum  UnitArea {
       Sq_meter,
       Sq_Feet
   };
enum  UnitTemp {
       Celsius,
       Fahrenhiet
   };

class MainWindow : public QObject
{
    Q_OBJECT
public:

    QString tempString = "";
    QString name="";
    QString lastname="";
    QString email = "";
    QString varphone = "";
    QString address = "";
    QString city = "";
    QString state = "";
    QString website1 = "";
    QString zipcode = "";
    QString hosting = "";
    QString project = "";
    QString read = "";
    QString write = "";
    QString jsonwrite = "";
    QString jsonread = "";
    QString sunit="";
    double meter;
    double feet;
    Q_INVOKABLE bool isValidEmail(QString email);
    explicit MainWindow(QObject *parent = nullptr);


    Q_INVOKABLE void readTextFile(QString filePath);

    Q_INVOKABLE QString getName() ;
    Q_INVOKABLE void setName(QString nameId);
    Q_INVOKABLE QString getLastname();
    Q_INVOKABLE void setLastname(QString tlast);
    Q_INVOKABLE QString getEmail();
    Q_INVOKABLE void setEmail(QString newEmail);
    Q_INVOKABLE QString getVarphone();
    Q_INVOKABLE void setVarphone(QString newVarphone);
    Q_INVOKABLE QString getAddress();
    Q_INVOKABLE void setAddress(QString newAddress);
    Q_INVOKABLE QString getCity();
    Q_INVOKABLE void setCity(QString newCity);
    Q_INVOKABLE QString getState();
    Q_INVOKABLE void setState(QString newState);
    Q_INVOKABLE QString getWebsite1();
    Q_INVOKABLE void setWebsite1(QString newWebsite1);
    Q_INVOKABLE QString getZipcode();
    Q_INVOKABLE void setZipcode(QString newZipcode);
    Q_INVOKABLE QString getHosting();
    Q_INVOKABLE void setHosting(QString newHosting);
    Q_INVOKABLE QString getProject();
    Q_INVOKABLE void setProject(QString newProject);
    Q_INVOKABLE QString readJsonFile();
    Q_INVOKABLE void writeJsonFile();

    Q_INVOKABLE double convertValue(double val,int selUnit);

    Q_INVOKABLE double convertareaValue(double areVal,double selarUnit);

     Q_INVOKABLE double convertTempValue(double tempVal,double seltempUnit);


    Q_INVOKABLE void setValue(QString newName, QString newLastname, QString newEmail, QString newVarphone, QString newAddress, QString newCity, QString newProject);
};
#endif // MAINWINDOW_H
