#
# mongoose
#
add_library(mongoose mongoose/mongoose.c mongoose/mongoose.h)

target_include_directories(mongoose PUBLIC mongoose)

