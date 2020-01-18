#ifndef _QUICKVIEW_RELOADER_WRAPPER_H__
#define _QUICKVIEW_RELOADER_WRAPPER_H__

#include "QuickViewReloader.h"
#include "Resource.h"

class QuickViewReloaderWrapper : public QuickViewReloader
{
public:
    QuickViewReloaderWrapper();
    ~QuickViewReloaderWrapper();
private:
    virtual bool initSkin();
    virtual void beforeLoad();
    virtual void afterLoad();
    virtual void setContextProperies( QQmlContext * pQmlContext );
    virtual void registerToQml();
    void Clear();
protected:
    Resource *m_res;
};


#endif//_QUICKVIEW_RELOADER_WRAPPER_H__
