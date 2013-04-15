#include "include/server.h"
#include "mongoose.h"

#include <iostream>

static int begin_request_handler(struct mg_connection *conn) {
  mg_request_info const * request_info = mg_get_request_info(conn);
  Server * server = static_cast<Server *>(request_info->user_data);
  if(server) {
    std::string response = server->forward(request_info->query_string);

    mg_printf(conn, "HTTP/1.1 200 OK\r\n"
        "Content-Type: text/plain\r\n"
        "Content-Length: %d\r\n" // Always set Content-Length
        "\r\n"
        "%s", response.size(), response.c_str());
    return 1;
  }

  return 0;
}

Server::Server(std::string port, std::function<std::string(std::string)> const & callback) :
    m_Port(port),
    m_Handle(callback) {
}

void Server::start() {
  mg_context * context = nullptr;
  mg_callbacks callbacks { };

  // List of options. Last element must be NULL.
  const char *options[] = { "listening_ports", m_Port.c_str(), 0 };

  // Prepare callbacks structure. We have only one callback, the rest are NULL.
  callbacks.begin_request = begin_request_handler;

  // Start the web server.
  context = mg_start(&callbacks, this, options);

  std::cout << "Listening on port " << m_Port << ".\n";
  std::cout << "Press enter to end." << std::endl;

  // Wait until user hits "enter". Server is running in separate thread.
  getchar();

  // Stop the server.
  mg_stop(context);
}

std::string Server::forward(std::string request) {
  return m_Handle(request);
}

