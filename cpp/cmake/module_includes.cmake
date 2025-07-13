# This file will collec all user define files into one list
message(STATUS "Colecting includes")

# Collect all .cpp files in src/ automatically
file(GLOB PROJECT_SOURCES CONFIGURE_DEPENDS "${PROJECT_SOURCE_DIR}/src/*.cpp")


