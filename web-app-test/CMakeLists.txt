add_executable(web-app-test
  test-handler.cc
)

target_link_libraries(web-app-test
  PRIVATE googlemock-main
  PRIVATE web-app
)

add_custom_target(run-web-app-test
  COMMAND web-app-test --gtest_color=yes
)

