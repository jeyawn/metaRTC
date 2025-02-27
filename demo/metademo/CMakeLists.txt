cmake_minimum_required(VERSION 3.10)
project(metademo LANGUAGES CXX)
add_definitions(-D__STDC_FORMAT_MACROS -DHAVE_STRUCT_TIMESPEC -DWIN32_LEAN_AND_MEAN)
include_directories(${CMAKE_SOURCE_DIR}/demo/metademo)
include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/thirdparty/include)
include_directories(${CMAKE_SOURCE_DIR}/thirdparty/user_include)
link_directories(${CMAKE_SOURCE_DIR}/thirdparty/lib/Win32)
link_directories(${CMAKE_SOURCE_DIR}/thirdparty/lib/Win32/ffmpeg)
if (CMAKE_SYSTEM_NAME MATCHES "Windows")
    set (LIB_ARCH "ws2_32.lib" "Strmiids.lib" "Avrt.lib" "DXGI.lib" "d3d11.lib")
endif()
set (LIB_THIRDPARTY "yuv.lib" "srtp2.lib" "opus.lib" "usrsctp.lib" "speexdsp.lib" "libssl.lib" "libcrypto.lib")
set (LIB_FFMPEG "avcodec.lib" "avformat.lib" "avutil.lib" "avdevice.lib" "avfilter.lib" "swresample.lib")
file(GLOB sources *.cpp *.h)
file(GLOB yangpush yangpush/*.cpp yangpush/*.h)
add_executable(metademo ${sources} ${yangpush})
target_link_libraries(metademo metartccore6 metartc6 codec ${LIB_THIRDPARTY} ${LIB_FFMPEG} ${LIB_ARCH})
