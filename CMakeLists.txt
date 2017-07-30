cmake_minimum_required(VERSION 3.2)
project(extreme-startup)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
add_compile_options("-Wall")

include(googletest.cmake)
include(mongoose.cmake)

add_subdirectory(web-app)
add_subdirectory(test)

add_custom_target(run-tests ALL
  DEPENDS run-handler-test
)

