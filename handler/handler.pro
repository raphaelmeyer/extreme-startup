include(../common.pri)

TARGET = handler
TEMPLATE = lib
CONFIG += staticlib

INCLUDEPATH += include

SOURCES += \
    handler.cc

HEADERS += \
    include/handler.h

