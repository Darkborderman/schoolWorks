cmake_minimum_required(VERSION 3.4)

project(NANATest)

set(CMAKE_CXX_STANDARD 11)

file(GLOB SOURCE *.cpp)
file(GLOB HEADER *.h)

find_path(TEST_PATH "CMakeLists.txt" ext/nana)
message(${TEST_PATH})
set(NANA_PATH ${TEST_PATH})

if (NOT EXISTS "${NANA_PATH}/CMakeLists.txt")
    message(FATAL_ERROR "Please specify valid nana path! + ${NANA_PATH}/CMakeLists.txt")
endif ()

add_subdirectory(${NANA_PATH})

add_executable(NANATest ${SOURCE} ${HEADER})
target_link_libraries(NANATest nana)
if(UNIX)
find_package (Threads REQUIRED)
target_link_libraries(NANATest -lfontconfig ${CMAKE_THREAD_LIBS_INIT})
endif()