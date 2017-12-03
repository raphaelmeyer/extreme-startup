#include "server.h"

#include <mongoose.h>

#include <iostream>

static void event_handler(mg_connection * nc, int event, void * event_data) {
  if(event == MG_EV_HTTP_REQUEST) {
    auto message = static_cast<http_message const *>(event_data);
    char buffer[1024];
    if(mg_get_http_var(&message->query_string, "q", buffer, sizeof(buffer)) > 0) {
      Server * me = static_cast<Server *>(nc->user_data);
      if(me) {
        auto response = me->handle(buffer);
        mg_send_head(nc, 200, response.size(), "Content-Type: text/plain");
        mg_send(nc, response.c_str(), response.size());
        return;
      }
    }
    mg_http_send_error(nc, 400, nullptr);
  }
}

Server::Server(std::string _port, HandlerFunc const & _handler)
  : port(_port), handler(_handler), running(false), server_thread() {
}

void Server::start() {
  running = true;
  server_thread = std::thread([&] {
    mg_mgr manager{};
    mg_mgr_init(&manager, nullptr);
    auto connection = mg_bind(&manager, port.c_str(), event_handler);
    if(! connection) {
      throw std::exception();
    }
    connection->user_data = static_cast<void *>(this);

    mg_set_protocol_http_websocket(connection);
    std::cout << "Listening on port " << port << ".\n";
    std::cout << "Press ctrl+d to exit.\n";

    while(running) {
      mg_mgr_poll(&manager, 100);
    }
    mg_mgr_free(&manager);
  });
}

void Server::stop() {
  std::cout << "Shutting down...\n";
  running = false;
  server_thread.join();
  std::cout << "...done.\n";
}

std::string Server::handle(std::string const & request) {
  auto pos = request.find(": ");
  if(pos != std::string::npos) {
    auto const id = request.substr(0, pos);
    auto const query = request.substr(pos + 2);
    std::cout << "query   [" << id << "] : " << query << "\n";
    auto const response = handler(query);
    std::cout << "reponse [" << id << "] : " << response << "\n";
    return response;
  }
  return {};
}
