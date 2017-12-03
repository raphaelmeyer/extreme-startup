cmake_minimum_required(VERSION 3.2)
project(extreme-startup)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(CMAKE_COMPILER_IS_GNUCC)
  add_compile_options("-Wall" "-Werror")
endif()

include(googletest.cmake)
include(mongoose.cmake)

add_subdirectory(web-app)
add_subdirectory(web-app-test)

add_subdirectory(main)

add_custom_target(run-tests ALL
  DEPENDS run-web-app-test
)

add_custom_target(format
  COMMAND
    find main web-app web-app-test -name "*.h" -or -name "*.cc" | xargs clang-format -i -style=file
  WORKING_DIRECTORY
    ${PROJECT_SOURCE_DIR}
)

