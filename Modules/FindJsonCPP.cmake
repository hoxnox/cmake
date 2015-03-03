# Find JsonCpp library
# Merder Kim <hoxnox@gmail.com>
# 
# input:
#  JSONCPP_ROOT
#
# output:
#  JSONCPP_FOUND
#  JSONCPP_INCLUDE_DIR
#  JSONCPP_LIBRARIES
#

if(JSONCPP_INCLUDE_DIR AND JSONCPP_LIBRARIES)
    set(JSONCPP_FIND_QUITELY TRUE) # cached
endif(JSONCPP_INCLUDE_DIR AND JSONCPP_LIBRARIES)

if(NOT DEFINED JSONCPP_ROOT)
    set(JSONCPP_ROOT /usr /usr/local $ENV{JSONCPP_ROOT})
endif(NOT DEFINED JSONCPP_ROOT)

find_path(JSONCPP_INCLUDE_DIR json/json.h
    PATHS ${JSONCPP_ROOT}
    PATH_SUFFIXES jsoncpp jsoncpp/include json json/include include jsoncpp/json
)

# Get the GCC compiler version
#EXEC_PROGRAM(${CMAKE_CXX_COMPILER}
#            ARGS ${CMAKE_CXX_COMPILER_ARG1} -dumpversion
#            OUTPUT_VARIABLE _gcc_COMPILER_VERSION
#            OUTPUT_STRIP_TRAILING_WHITESPACE
#            )
#SET(JSONCPP_NAMES ${JSONCPP_NAMES} libjson_linux-gcc-${_gcc_COMPILER_VERSION}_libmt.so)

find_library(JSONCPP_LIBRARIES
    NAMES jsoncpp
    PATHS ${JSONCPP_ROOT}
    PATH_SUFFIXES lib
)
mark_as_advanced(JSONCPP_INCLUDE_DIR JSONCPP_LIBRARIES)


include("${CMAKE_ROOT}/Modules/FindPackageHandleStandardArgs.cmake")
FIND_PACKAGE_HANDLE_STANDARD_ARGS(JSONCPP DEFAULT_MSG JSONCPP_INCLUDE_DIR JSONCPP_LIBRARIES)


