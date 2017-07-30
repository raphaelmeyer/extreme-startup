#pragma once

#include <string>

class Handler {
public:
  Handler();
  std::string handle(std::string const & query);
};

