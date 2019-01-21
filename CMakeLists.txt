cmake_minimum_required (VERSION 2.8.12)
project(app)

set(CMAKE_CXX_FLAGS "-std=c++1y -Wno-invalid-offsetof -pthread")

find_package(Boost COMPONENTS program_options system filesystem thread REQUIRED)
include_directories( ${Boost_INCLUDE_DIR} )

file(GLOB _src "*.cpp" "*.h")

add_executable(app ${_src} )
target_link_libraries(app LINK_PUBLIC -pthread ${Boost_LIBRARIES})
