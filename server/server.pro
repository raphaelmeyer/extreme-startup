include(../common.pri)

TARGET = server
TEMPLATE = app

INCLUDEPATH += include

SOURCES += \
  main.cc \

include(../handler/handler.pri)
include(../mongoose/mongoose.pri)

