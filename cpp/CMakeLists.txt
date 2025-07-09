set(PROJECT_NAME MyProject)

cmake_minimum_required(VERSION 4.0)

project(
  ${PROJECT_NAME}
  VERSION 0.1.0
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --- maine xecutable ---
add_executable(${PROJECT_NAME} main.cpp)

# --- Add custom CMake modules directory ---
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# --- includes ---
include(includes)

message(STATUS "Building in configuration: ${CMAKE_CONFIG_NAME}")

target_include_directories(${PROJECT_NAME}
                            PUBLIC 
                              ${PROJECT_NAME}Include 
                              ${XLSXWRITER_INCLUDE_DIRS}
                              ${RAPIDCSV_INCLUDE_DIRS})

target_link_libraries(    ${PROJECT_NAME}
                            PRIVATE 
                              ${PROJECT_NAME}Include
                              fmt::fmt
                              ${XLSXWRITER_LIBRARIES}
                              ${XLSXWRITER_LDFLAGS_OTHER})

target_link_directories(  ${PROJECT_NAME}
                            PRIVATE
                              ${PROJECT_NAME}Include
                              ${XLSXWRITER_LIBRARY_DIRS}
                              ${RAPIDCSV_INCLUDE_DIRS})

# --- post build scripts ---
include(post_build)
