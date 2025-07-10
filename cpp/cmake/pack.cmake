# --- Default packaging setup, will be overritten by CMakePresets.json --- 


install(
  TARGETS 
    ${PROJECT_NAME}                 DESTINATION bin
    ${PROJECT_NAME}Liblary          DESTINATION lib)
install(
  FILES
    ${CMAKE_SOURCE_DIR}/LICENSE.txt DESTINATION share/doc)


# CPack configuration
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_DESCRIPTION "${PROJECT_DESCRIPTION}")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_PACKAGE_VENDOR "YourCompany")
set(CPACK_PACKAGE_CONTACT "your.email@example.com")
set(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_SOURCE_DIR}/package/${PROJECT_NAME}_${PresetName}_${PROJECT_VERSION}")

include(CPack)
