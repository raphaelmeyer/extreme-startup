include(../common.pri)

TARGET = test
TEMPLATE = app
CONFIG += console

SOURCES += \
  test-handler.cc


include(../googlemock/googlemock.pri)
include(../handler/handler.pri)

