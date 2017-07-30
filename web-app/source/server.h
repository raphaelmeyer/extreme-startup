#pragma once

#include <functional>
#include <string>
#include <thread>

class Server {
public:
  using HandlerFunc = std::function<std::string(std::string const &)>;

  Server(std::string _port, HandlerFunc const & _handler);

  void start();
  void stop();

  std::string handle(std::string const & request);

private:
  std::string port;
  HandlerFunc handler;
  bool running;
  std::thread server_thread;
};

