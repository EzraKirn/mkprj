enable_testing()

add_subdirectory(${CMAKE_SOURCE_DIR}/submodules/googletest)
include(GoogleTest)

file(GLOB TEST_SOURCES "${CMAKE_SOURCE_DIR}/test/*.test.cpp")
foreach(test_src ${TEST_SOURCES})
    get_filename_component(test_name ${test_src} NAME_WE)
    add_executable(${test_name} ${test_src})
    target_include_directories(${test_name} PRIVATE ${CMAKE_SOURCE_DIR}/inc)
    target_link_libraries(${test_name} PRIVATE GTest::gtest_main)
    gtest_discover_tests(${test_name})
endforeach()

