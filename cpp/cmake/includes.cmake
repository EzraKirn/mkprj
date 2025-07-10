# This file will collec all used define files and will compile them into shared liblary

message(STATUS "Colecting includes")

# Collect all .cpp files in src/ automatically
file(GLOB INCLUDE_SOURCES CONFIGURE_DEPENDS "${PROJECT_SOURCE_DIR}/src/*.cpp")

# Create the static library from include files
add_library(${PROJECT_NAME}Include SHARED)

target_sources(${PROJECT_NAME}Include
                PUBLIC
                  ${INCLUDE_SOURCES})

# Make headers available to all targets that link this library
target_include_directories(${PROJECT_NAME}Include
                            PUBLIC 
                              "${PROJECT_SOURCE_DIR}/inc")
