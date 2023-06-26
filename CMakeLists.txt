cmake_minimum_required(VERSION 3.12...3.31)

include(CheckIncludeFile)
include(CheckFunctionExists)

PROJECT(
	ministat
	LANGUAGES C
	DESCRIPTION "Simple command-line statistics utility"
	HOMEPAGE_URL https://github.com/eyalroz/ministat
	VERSION 1.1.0
)

check_include_file( sys/ioctl.h  HAVE_IOCTL_H  )
check_include_file( unistd.h     HAVE_UNISTD_H )

if(NOT (${HAVE_IOCTL_H} AND ${HAVE_UNISTD_H}))
	message(FATAL_ERROR "Missing critical header files" )
endif()

check_function_exists(strdup HAVE_STRDUP)

if(NOT HAVE_STRDUP)
	message( FATAL_ERROR "The strdup() function is unavailable" )
endif()


add_executable(ministat src/ministat.c)
target_link_libraries(ministat PUBLIC m) # C math library

set_property(TARGET ministat PROPERTY C_STANDARD           90)
set_property(TARGET ministat PROPERTY C_STANDARD_REQUIRED  OFF)
set_property(TARGET ministat PROPERTY C_EXTENSIONS         ON)

file(ARCHIVE_CREATE
	OUTPUT ministat.1.gz
	PATHS ${PROJECT_SOURCE_DIR}/src/ministat.man
	FORMAT raw
	COMPRESSION GZip)

include(GNUInstallDirs)

install(TARGETS ministat RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}")
install(FILES ministat.1.gz DESTINATION "${CMAKE_INSTALL_MANDIR}")

