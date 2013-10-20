include(../common.pri)

TARGET = server
TEMPLATE = app
CONFIG += console

SOURCES += \
  main.cc \

include(../handler/handler.pri)
include(../mongoose/mongoose.pri)

