#ifndef HANDLER_H_
#define HANDLER_H_

#include <string>

class Handler {
public:
  Handler();
  std::string handle(std::string request);
};

#endif // HANDLER_H_
