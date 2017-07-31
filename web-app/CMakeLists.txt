add_library(web-app
  source/handler.cc
)

target_include_directories(web-app
  PUBLIC include
)

