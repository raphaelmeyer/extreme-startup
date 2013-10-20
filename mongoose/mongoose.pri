INCLUDEPATH += $$PWD/include
DEPENDPATH += $$PWD/include

LIBS += -lmongoose

CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../mongoose/release/
CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../mongoose/debug/

win32 {
    CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../mongoose/release/mongoose.lib
    CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../mongoose/debug/mongoose.lib
}

unix {
    CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../mongoose/release/libmongoose.a
    CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../mongoose/debug/libmongoose.a

    LIBS += -lpthread -ldl
}

