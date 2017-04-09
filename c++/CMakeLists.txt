cmake_minimum_required(VERSION 2.8)
project(hpatches_extract)
find_package(OpenCV REQUIRED)
find_package(Boost COMPONENTS system filesystem REQUIRED)
set (CMAKE_CXX_FLAGS "-std=c++0x -march=native")
add_executable(hpatches_extract main)
target_link_libraries(hpatches_extract ${OpenCV_LIBS} ${Boost_FILESYSTEM_LIBRARY}
  ${Boost_SYSTEM_LIBRARY})


