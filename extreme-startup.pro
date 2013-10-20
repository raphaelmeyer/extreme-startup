TEMPLATE = subdirs

SUBDIRS = \
    test \
    handler \
    googlemock \
    mongoose \
    main

test.depends += handler googlemock
main.depends += handler mongoose

