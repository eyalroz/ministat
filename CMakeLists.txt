cmake_minimum_required(VERSION 3.12...3.31)

include(CheckIncludeFile)

PROJECT(
	ministat
	LANGUAGES C
	DESCRIPTION "Simple command-line statistics utility"
	HOMEPAGE_URL https://github.com/eyalroz/ministat
	VERSION 1.1.0
)

add_executable(ministat)

check_include_file(sys/ioctl.h HAVE_IOCTL_H)
if(HAVE_IOCTL_H)
	target_compile_definitions(ministat PRIVATE HAVE_IOCTL_H)
endif()

check_include_file(unistd.h HAVE_UNISTD_H)
if(HAVE_UNISTD_H)
	target_compile_definitions(ministat PRIVATE HAVE_UNISTD_H)
endif()

if(NOT (HAVE_IOCTL_H AND HAVE_UNISTD_H))
	message(WARNING "ministat will be built without support for terminal-adaptive ouput")
endif()

target_sources(ministat PRIVATE src/ministat.c src/getopt.c)
target_link_libraries(ministat PUBLIC m) # C math library

set_property(TARGET ministat PROPERTY C_STANDARD           99)
set_property(TARGET ministat PROPERTY C_STANDARD_REQUIRED  ON)
set_property(TARGET ministat PROPERTY C_EXTENSIONS         OFF)

file(ARCHIVE_CREATE
	OUTPUT ministat.1.gz
	PATHS ${PROJECT_SOURCE_DIR}/src/ministat.man
	FORMAT raw
	COMPRESSION GZip)

include(GNUInstallDirs)

install(TARGETS ministat RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}")
install(FILES ministat.1.gz DESTINATION "${CMAKE_INSTALL_MANDIR}")

