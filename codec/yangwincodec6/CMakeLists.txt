project(codec)
add_definitions(-D__STDC_FORMAT_MACROS -DHAVE_STRUCT_TIMESPEC -DWIN32_LEAN_AND_MEAN)
include_directories(${CMAKE_SOURCE_DIR}/include)
set(codec_HEADERS
	codec/YangH264EncoderGpu.h
	YangEncoderGpu.h
	YangGpuEncoderFactory.h
	)

set(codec_SOURCES
	codec/YangH264EncoderGpu.cpp
	YangEncoderGpu.cpp
	YangGpuEncoderFactory.cpp
	)

set(nvcodec_HEADERS
	codec/NvCodec/nvenc.h
	codec/NvCodec/encoder_info.h
	codec/NvCodec/NvEncoder/nvEncodeAPI.h
	codec/NvCodec/NvEncoder/NvEncoder.h
	codec/NvCodec/NvEncoder/NvEncoderD3D11.h
	)

set(nvcodec_SOURCES
	codec/NvCodec/nvenc.cpp
	codec/NvCodec/NvEncoder/NvEncoder.cpp
	codec/NvCodec/NvEncoder/NvEncoderD3D11.cpp)


add_library(codec 
	${codec_SOURCES}
	${codec_HEADERS}
	${nvcodec_SOURCES}
	${nvcodec_HEADERS})

