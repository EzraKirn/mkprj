message(STATUS "Running Post-Build script")

# if(VCPKG_TARGET_TRIPLET STREQUAL x64-mingw-static)
#   foreach(
#     dll
#     "/usr/x86_64-w64-mingw32/bin/libwinpthread-1.dll"
#     "/usr/x86_64-w64-mingw32/bin/libgcc_s_seh-1.dll"
#     "/usr/x86_64-w64-mingw32/bin/libstdc++-6.dll")
#     add_custom_command(
#       TARGET ${PROJECT_NAME}
#       POST_BUILD
#       COMMAND ${CMAKE_COMMAND} -E copy_if_different "${dll}"
#               "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"
#       COMMENT "Copying ${dll} to release directory")
#   endforeach()
# endif()
#
add_custom_command(
  TARGET ${PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${CMAKE_BINARY_DIR}/compile_commands.json" "${CMAKE_SOURCE_DIR}")
