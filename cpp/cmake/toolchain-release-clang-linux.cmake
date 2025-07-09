# Specify the system name for native Linux builds
set(CMAKE_SYSTEM_NAME Linux)

# Specify the Clang compilers (adjust paths if you use a custom install)
set(CMAKE_C_COMPILER /usr/bin/clang)
set(CMAKE_CXX_COMPILER /usr/bin/clang++)

include(/home/grzeszko/vcpkg/scripts/buildsystems/vcpkg.cmake)
