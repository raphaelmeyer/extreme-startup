TEMPLATE = subdirs

SUBDIRS = \
    test \
    handler \
    googlemock \
    mongoose \
    main

test.depends += handler googlemock
server.depends += handler mongoose

