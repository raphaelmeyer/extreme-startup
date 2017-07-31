find_package(Threads)

add_executable(server-exe
  source/main.cc
  source/server.cc
)

target_link_libraries(server-exe
  PRIVATE web-app
  PRIVATE mongoose
  PRIVATE ${CMAKE_THREAD_LIBS_INIT}
)

