#include <gtest/gtest.h>

#include <handler.h>

namespace {

TEST(Handler, Warmup) {
  Handler handler;
  std::string request = "q=219a0090:%20what%20is%20your%20name";
  std::string expected = "Name";
  EXPECT_EQ(expected, handler.handle(request));
}

}

