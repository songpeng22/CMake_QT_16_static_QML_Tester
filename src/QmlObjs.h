#pragma once

#include "global_include.h"
#include <vector>
using namespace std;

class FlyWeight : public QObject
{
public:
    FlyWeight(){}
};

class CQmlObjFly : public FlyWeight{
public:
    CQmlObjFly(){}
public:
    QString objName;
    QObject* object;
};

class CQmlObjs : public QObject
{
public:
    CQmlObjs();
    ~CQmlObjs(){
        Cleanup();
    }
public:
    QObject * GetObj(char * objName);
    void SetRootObject(QObject *object){
        m_rootObject = object;
    }
    void setProperty(QString objectName, QString name, QVariant value){
        if (m_rootObject == nullptr){
            qDebug() << "setProperty()::invalid m_rootObject";
            return;
        }
        QMetaObject::invokeMethod(m_rootObject, "setProperty",
			Qt::DirectConnection,
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, objectName),
			Q_ARG(QVariant, name),
			Q_ARG(QVariant, value));
	    qDebug() << "setProperty returned:" << returnedValue;
    }
    QVariant returnedValue;
	QVariant objectName = "objComboCountry";
	QVariant name = "visible";
	QVariant value = false;
    
protected:
    QObject * FindSubObject(QString qstr) {
        QObject * objParent = m_rootObject;
        if (!objParent) return nullptr;

        QList<QObject *> objSubs = objParent->findChildren<QObject *>();
        if (!objSubs.empty()){
	        for (int i = 0; i < objSubs.size(); ++i) {
                if ( !objSubs.at(i)->objectName().isEmpty() )
#if defined( WX_2_QT_DEBUG )
                    qDebug() << "Find Sub:" << objSubs.at(i)->objectName();
#endif
                if (objSubs.at(i)->objectName() == qstr){
                    qDebug() <<"Found objectName:" << objSubs.at(i)->objectName();
                    return objSubs.at(i);
                }
            }    
        }
        return nullptr;
    }
    void Cleanup()
    {
        vector<CQmlObjFly*>::iterator it;
        for (it = _fly.begin(); it != _fly.end(); it++){
            CQmlObjFly * pCQmlObjFly = (*it);
            if (pCQmlObjFly){
                delete pCQmlObjFly;
                pCQmlObjFly = nullptr;
            }
        }
    }
public:
    static CQmlObjs* Instance(){
        static CQmlObjs _instance;
        return &_instance;
    }
protected:
    QObject* m_rootObject;
private:
	vector<CQmlObjFly*> _fly;
};