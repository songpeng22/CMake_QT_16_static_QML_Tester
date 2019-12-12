#include "EngineReloaderWrapper.h"
//API
#include <QQmlContext>
#include <QGuiApplication>

//
#include "GlobalVariant.h"
#include "QmlObjs.h"

EngineReloaderWrapper::EngineReloaderWrapper()
{

}

EngineReloaderWrapper::~EngineReloaderWrapper()
{

}

void EngineReloaderWrapper::setContextProperies(QQmlContext * pQmlContext)
{
    qDebug() << "EngineReloaderWrapper::setContextProperies()";

    //Engine
    pQmlContext->setContextProperty("engine", this);
    //Engine.Global
    pQmlContext->setContextProperty("Global",GlobalVariant::Instance());
    //Model
    
    qsList.append("tha");
    qsList.append("ind");
    qsList.append("chn");
    pQmlContext->setContextProperty("myModel", QVariant::fromValue(qsList));
    
    qsListLoad.append("123");
    qsListLoad.append("456");
    qsListLoad.append("789");
    pQmlContext->setContextProperty("myModelLoad", QVariant::fromValue(qsListLoad));
}

void EngineReloaderWrapper::registerToQml()
{
    qDebug() << "EngineReloaderWrapper::registerToQml()";

}

void EngineReloaderWrapper::beforeLoad()
{
    qDebug() << "EngineReloaderWrapper::beforeLoad()";

    setContextProperies(m_qmlContext);
    registerToQml();
}

void EngineReloaderWrapper::afterLoad()
{
    qDebug() << "EngineReloaderWrapper::afterLoad()";

    QObject *rootObject = qobject_cast<QObject*>(m_instance->rootObjects().first());

    QVariant returnedValue;
    QVariant file = "Hello from C++";
    QMetaObject::invokeMethod(rootObject, "initQmlLoader",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, file));

    //错误的使用方法,not expose qml to c++
    //CQmlObjs::Instance()->SetRootObject(rootObject);
    //qDebug() << CQmlObjs::Instance()->GetObj("objButton1")->property("text").toString();
    //CQmlObjs::Instance()->GetObj("objButton1")->setProperty("text", "Next");
    //qDebug() << CQmlObjs::Instance()->GetObj("objButton1")->property("text").toString();
}

void EngineReloaderWrapper::setReloadSubQml( QString qsFile )
{
    qDebug() << "EngineReloaderWrapper::setReloadSubQml" << qsFile;

}
