# Workaround for MSVC 2012
win32-msvc2012: DEFINES += _VARIADIC_MAX=10

INCLUDEPATH += $$PWD/include
DEPENDPATH += $$PWD/include

LIBS += -lgooglemock

CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../googlemock/release/
CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../googlemock/debug/

win32 {
  CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../googlemock/release/googlemock.lib
  CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../googlemock/debug/googlemock.lib
}

unix {
  CONFIG += warn_off

  CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../googlemock/release/libgooglemock.a
  CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../googlemock/debug/libgooglemock.a

  LIBS += -lpthread
}
