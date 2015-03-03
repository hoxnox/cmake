# Find CURL library
# Merder Kim <hoxnox@gmail.com>
# 
# input:
#  CURL_ROOT
#
# output:
#  CURL_FOUND
#  CURL_INCLUDE_DIR
#  CURL_LIBRARIES
#

if(CURL_INCLUDE_DIR AND CURL_LIBRARIES)
    set(CURL_FIND_QUITELY TRUE) # cached
endif(CURL_INCLUDE_DIR AND CURL_LIBRARIES)

if(NOT DEFINED CURL_ROOT)
    set(CURL_ROOT /usr /usr/local $ENV{CURL_ROOT})
endif(NOT DEFINED CURL_ROOT)

find_path(CURL_INCLUDE_DIR curl.h
    PATHS ${CURL_ROOT}
    PATH_SUFFIXES curl/include include curl
)

find_library(CURL_LIBRARIES
    NAMES curl
    PATHS ${CURL_ROOT}
    PATH_SUFFIXES lib
)
mark_as_advanced(CURL_INCLUDE_DIR CURL_LIBRARIES)


include("${CMAKE_ROOT}/Modules/FindPackageHandleStandardArgs.cmake")
FIND_PACKAGE_HANDLE_STANDARD_ARGS(CURL DEFAULT_MSG CURL_INCLUDE_DIR CURL_LIBRARIES)


