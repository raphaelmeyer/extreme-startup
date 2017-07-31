cmake_minimum_required(VERSION 3.2)
project(extreme-startup)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
add_compile_options("-Wall")

include(googletest.cmake)
include(mongoose.cmake)

add_subdirectory(web-app)
add_subdirectory(web-app-test)

add_subdirectory(main)

add_custom_target(run-tests ALL
  DEPENDS run-web-app-test
)

