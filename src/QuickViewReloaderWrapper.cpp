#include "QuickViewReloaderWrapper.h"
//API
#include <QQmlContext>
#include <QGuiApplication>
#include <QCoreApplication >
#include <QDir>

QuickViewReloaderWrapper::QuickViewReloaderWrapper()
{
    m_res = new Resource();
	m_settings = new Settings();
}

QuickViewReloaderWrapper::~QuickViewReloaderWrapper()
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

QString QuickViewReloaderWrapper::readConf()
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

bool QuickViewReloaderWrapper::initSkin()
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
		qDebug() << "ini Ready , ignore local set";
		m_res->setIniReady(false);
	}
	else {
		qDebug() << "ini not Ready , set one";
		m_res->setIniDirPath(QCoreApplication::applicationDirPath());
		m_res->setIniFileName(iniFileName/*"posscale.ini"*/);
	}
	m_res->reloadSkin();

	qDebug() << "initSkin:yes;setStyle:no";
	return true;
}

void QuickViewReloaderWrapper::beforeLoad()
{
    qDebug() << "QuickViewReloaderWrapper::beforeLoad()";
    setContextProperies(m_qmlContext);
    registerToQml();
}

void QuickViewReloaderWrapper::afterLoad()
{
    qDebug() << "QuickViewReloaderWrapper::afterLoad()";
}

void QuickViewReloaderWrapper::setContextProperies(QQmlContext * pQmlContext)
{
    qDebug() << "+QuickViewReloaderWrapper::setContextProperies()";
    //Engine.path
    pQmlContext->setContextProperty("applicationDirPath", QGuiApplication::applicationDirPath());
    pQmlContext->setContextProperty("applicationFilePath", QGuiApplication::applicationFilePath());
    pQmlContext->setContextProperty("QDircurrentpath", QDir::currentPath());
    pQmlContext->setContextProperty("QDirRootPath", QDir::rootPath());
    pQmlContext->setContextProperty("QDirHomePath", QDir::homePath());
    //loadSkin
    pQmlContext->setContextProperty("Resource", m_res);
    //
    qDebug() << "-QuickViewReloaderWrapper::setContextProperies()";
}

void QuickViewReloaderWrapper::registerToQml()
{
    qDebug() << "+QuickViewReloaderWrapper::registerToQml()";
    
    qDebug() << "-QuickViewReloaderWrapper::registerToQml()";
}


