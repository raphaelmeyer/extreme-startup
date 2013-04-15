#include <server.h>
#include <handler.h>

int main() {
  Handler handler;
  auto callback = std::bind(&Handler::handle, handler, std::placeholders::_1);

  Server server("3001", callback);
  server.start();
}

