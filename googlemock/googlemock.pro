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

