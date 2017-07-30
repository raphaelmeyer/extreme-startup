add_library(web-app
  source/handler.cc
  source/server.cc
)

target_include_directories(web-app
  PUBLIC include
)

target_link_libraries(web-app
  PRIVATE mongoose
)

add_executable(server-exe
  source/main.cc
)

target_link_libraries(server-exe
  PRIVATE web-app
)

