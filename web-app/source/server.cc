#include "server.h"
#include "mongoose.h"

#include <iostream>

/*
static int begin_request_handler(struct mg_connection *conn) {
  mg_request_info const * request_info = mg_get_request_info(conn);
  Server * server = static_cast<Server *>(request_info->user_data);
  if(server) {
    std::string response = server->forward(request_info->query_string);

    mg_printf(conn, "HTTP/1.1 200 OK\r\n"
        "Content-Type: text/plain\r\n"
        "Content-Length: %lu\r\n" // Always set Content-Length
        "\r\n"
        "%s", response.size(), response.c_str());
    return 1;
  }

  return 0;
}
*/

static void event_handler(mg_connection * nc, int event, void * event_data) {
}

Server::Server(std::string port, std::function<std::string(std::string)> const & callback) :
    m_Port(port),
    m_Handle(callback) {
}

void Server::start() {

  struct mg_mgr mgr{};
  struct mg_bind_opts bind_options{};

  mg_mgr_init(&mgr, nullptr);
  auto connection = mg_bind_opt(&mgr, m_Port.c_str(), event_handler, bind_options);
  if(not connection) {
    throw std::exception();
  }

  mg_set_protocol_http_websocket(connection);

  std::cout << "Listening on port " << m_Port << ".\n";

  for(;;) {
    mg_mgr_poll(&mgr, 1000);
  }
  mg_mgr_free(&mgr);
}

std::string Server::forward(std::string request) {
  return m_Handle(request);
}

