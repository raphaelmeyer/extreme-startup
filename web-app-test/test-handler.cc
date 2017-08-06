#include <gmock/gmock.h>

#include <handler.h>

using namespace testing;

namespace {

TEST(A_Handler, should_return_its_name_when_asked_for) {
  Handler testee;
  std::string const query = "what is your name";

  ASSERT_THAT(testee.handle(query), Eq("Name"));
}
}
