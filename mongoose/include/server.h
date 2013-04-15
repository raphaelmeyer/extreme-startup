#ifndef SERVER_H_
#define SERVER_H_

#include <functional>
#include <string>

class Server {
public:
  Server(std::string port, std::function<std::string(std::string)> const & callback);

  void start();
  std::string forward(std::string request);

private:
  std::string m_Port;
  std::function<std::string(std::string)> m_Handle;
};

#endif // SERVER_H_
