add_executable(handler-test
  test-handler.cc
)

target_link_libraries(handler-test
  PRIVATE googlemock-main
  PRIVATE web-app
)

add_custom_target(run-handler-test
  COMMAND handler-test
)

