include(../common.pri)

TARGET = test
TEMPLATE = app

INCLUDEPATH += .

SOURCES += \
  test-handler.cc


include(../googlemock/googlemock.pri)
include(../handler/handler.pri)

