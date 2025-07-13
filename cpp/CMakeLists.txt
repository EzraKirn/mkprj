set(PROJECT_NAME <NAME>)
set(PROJECT_VERSION 0.0.1)

cmake_minimum_required(VERSION 4.0)

project(
  ${PROJECT_NAME}
    VERSION ${PROJECT_VERSION} 
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --- Add custom CMake modules directory ---
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(script_updateSubmodules)


# --- main executable ---
add_executable(            ${PROJECT_NAME} main.cpp)

# --- adding users defined sources and headers to main executable ---
include(module_includes)
target_sources(            ${PROJECT_NAME} PRIVATE ${PROJECT_SOURCES}) 
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/inc)

include(module_packages)
# target_link_libraries(     ${PROJECT_NAME} PRIVATE )

include(module_testing)

# --- post build scripts ---
include(script_postBuild)
