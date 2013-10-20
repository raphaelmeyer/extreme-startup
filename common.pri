QT -= gui core

unix: QMAKE_CXXFLAGS += -std=c++11

# use subfolders for release and debug builds
CONFIG += \
  debug_and_release \
  debug_and_release_target

