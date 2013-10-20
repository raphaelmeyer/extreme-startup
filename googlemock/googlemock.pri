# Workaround for MSVC 2012
win32-msvc2012: DEFINES += _VARIADIC_MAX=10

win32 {

  INCLUDEPATH += $$PWD/externals/include
  DEPENDPATH += $$PWD/externals/include

  LIBS += -L$$PWD/externals/lib/

  CONFIG(release, debug|release): LIBS += -lgooglemock
  CONFIG(debug, debug|release): LIBS += -lgooglemockd

  CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/externals/lib/googlemock.lib
  CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/externals/lib/googlemockd.lib
}

unix {
  CONFIG += warn_off

  INCLUDEPATH += $$PWD/googlemock/include
  DEPENDPATH += $$PWD/googlemock/include

  CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../googlemock/release/
  CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../googlemock/debug/

  LIBS += -lgooglemock -lpthread
}
