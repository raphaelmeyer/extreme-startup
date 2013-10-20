INCLUDEPATH += $$PWD/include
DEPENDPATH += $$PWD/include

LIBS += -lhandler

CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../handler/release/
CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../handler/debug/

win32 {
  CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../handler/release/handler.lib
  CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../handler/debug/handler.lib
}

unix {
  CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../handler/release/libhandler.a
  CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../handler/debug/libhandler.a
}

