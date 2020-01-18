#include "QuickViewReloaderWrapper.h"
//API
#include <QQmlContext>
#include <QGuiApplication>
#include <QCoreApplication >
#include <QDir>

QuickViewReloaderWrapper::QuickViewReloaderWrapper()
{
    m_res = nullptr;
}

QuickViewReloaderWrapper::~QuickViewReloaderWrapper()
{
    if( m_res ){
        delete m_res;
        m_res = nullptr;
    }
}

bool QuickViewReloaderWrapper::initSkin()
{
	m_res = new Resource();
	//format ini file name
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
	m_res->setIniDirPath(QCoreApplication::applicationDirPath());
	m_res->setIniFileName(iniFileName/*"posscale.ini"*/);
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


