#ifndef _ENGINE_RELOADER_WRAPPER_H__
#define _ENGINE_RELOADER_WRAPPER_H__

#include "EngineReloader.h"
#include "Resource.h"
#include "Settings.h"

class EngineReloaderWrapper : public EngineReloader
{
public:
    EngineReloaderWrapper();
    ~EngineReloaderWrapper();
public slots:
    virtual void setReloadSubQml( QString qsFile );
private:
    virtual bool initSkin();
    virtual QString readConf();
    virtual void beforeLoad();
    virtual void afterLoad();
    virtual void setContextProperies( QQmlContext * pQmlContext );
    virtual void registerToQml();
    void Clear();
protected:
    Resource *m_res;
    Settings *m_settings;
private:
    QString m_subQmlName;
    QStringList qsList;
    QStringList qsListLoad;
};


#endif//_ENGINE_RELOADER_WRAPPER_H__
