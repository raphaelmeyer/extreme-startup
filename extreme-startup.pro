TEMPLATE = subdirs

SUBDIRS = \
    server \
    test \
    handler \
    googlemock \
    mongoose

test.depends += handler googlemock
server.depends += handler mongoose

