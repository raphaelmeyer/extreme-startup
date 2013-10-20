# Workaround for MSVC 2012
win32-msvc2012: DEFINES += _VARIADIC_MAX=10

include(../common.pri)

TARGET = googlemock
TEMPLATE = lib
CONFIG += staticlib warn_off

INCLUDEPATH += include

SOURCES += \
    source/gmock-gtest-all.cc \
    source/gmock_main.cc

HEADERS += \
    include/gmock/gmock.h \
    include/gtest/gtest.h

