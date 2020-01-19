#include "EngineReloaderWrapper.h"
//API
#include <QQmlContext>
#include <QGuiApplication>

//
#include "GlobalVariant.h"
#include "QmlObjs.h"

EngineReloaderWrapper::EngineReloaderWrapper()
{
    m_res = new Resource();
	m_settings = new Settings();
}

EngineReloaderWrapper::~EngineReloaderWrapper()
{
    if( m_res ){
        delete m_res;
        m_res = nullptr;
    }
	if (m_settings) {
		delete m_settings;
		m_settings = nullptr;
	}
}

QString EngineReloaderWrapper::readConf()
{
	//read conf in new skin
	QString skinConfFileName = ":qtquickcontrols2.conf";
	m_settings->setFileName(skinConfFileName);

	QString styleName = m_settings->value("Controls/Style").toString();
	qDebug() << "skinConfFileName content: " << styleName;
	if (styleName == "Material") {
		QString theme = m_settings->value("Material/Theme").toString();
		qDebug() << "current theme is: " << theme;
	}
	return styleName;
}

bool EngineReloaderWrapper::initSkin()
{
	//form ini file name
#if 1
	QString filePath = QCoreApplication::applicationFilePath();
	QString fileName = filePath.mid(filePath.lastIndexOf("/") + 1);
#else
	QStringList cmdline_args = QCoreApplication::arguments();
	QString fileName = cmdline_args.at(0).toUtf8();
#endif
	qDebug() << "app fileName:" << fileName;
	QString iniFileName = fileName.left(fileName.indexOf(".") + 1) + "ini";
	qDebug() << "app iniFileName:" << iniFileName;
	//reload skin with ini settings
	if (m_res->isIniFileAlreadySet()){
		qDebug() << "ini string Ready , ignore local set";
		m_res->setIniReady(false);
	}
	else {
		qDebug() << "ini string not Ready , set one";
		m_res->setIniDirPath(QCoreApplication::applicationDirPath());
		m_res->setIniFileName(iniFileName/*"posscale.ini"*/);
	}
	m_res->reloadSkin();

	qDebug() << "initSkin:yes;setStyle:no";
	return true;
}

void EngineReloaderWrapper::setContextProperies(QQmlContext * pQmlContext)
{
    qDebug() << "EngineReloaderWrapper::setContextProperies()";

    //Engine
    pQmlContext->setContextProperty("engine", this);
    //Engine.Global
    pQmlContext->setContextProperty("Global",GlobalVariant::Instance());
    //Resource loadSkin
    pQmlContext->setContextProperty("Resource", m_res);
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

#if 1
    QVariant returnedValue;
	QVariant objectName = "objComboCountry";
	QVariant name = "visible";
	QVariant value = false;
    QMetaObject::invokeMethod(rootObject, "setProperty",
			Qt::DirectConnection,
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, objectName),
			Q_ARG(QVariant, name),
			Q_ARG(QVariant, value));
	qDebug() << "QML function returned:" << returnedValue;
#else
    QVariant returnedValue;
    QVariant file = "Hello from C++";
    QMetaObject::invokeMethod(rootObject, "initQmlLoader",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, file));
#endif
    
#if 1
    //��ȷ��ʹ�÷���
    CQmlObjs::Instance()->SetRootObject(rootObject);
    CQmlObjs::Instance()->setProperty("objComboLoad","visible",false);
#else
    //�����ʹ�÷���,not expose qml to c++
    //CQmlObjs::Instance()->SetRootObject(rootObject);
    //qDebug() << CQmlObjs::Instance()->GetObj("objButton1")->property("text").toString();
    //CQmlObjs::Instance()->GetObj("objButton1")->setProperty("text", "Next");
    //qDebug() << CQmlObjs::Instance()->GetObj("objButton1")->property("text").toString();
#endif
}

void EngineReloaderWrapper::setReloadSubQml( QString qsFile )
{
    qDebug() << "EngineReloaderWrapper::setReloadSubQml" << qsFile;

}
