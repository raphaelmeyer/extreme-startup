include(../common.pri)

TARGET = mongoose
TEMPLATE = lib
CONFIG += staticlib

INCLUDEPATH += include

SOURCES += \
    mongoose.c \
    server.cc

HEADERS += \
    mongoose.h \
    include/server.h

