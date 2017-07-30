#include <gtest/gtest.h>

#include <handler.h>

namespace {

TEST(A_Handler, should_return_its_name_when_asked_for) {
  Handler testee;

  std::string const query = "what is your name";
  std::string expected = "Name";

  EXPECT_EQ(expected, testee.handle(query));
}

}

