cmake_minimum_required(VERSION 3.10)
project(sqlite3_intern C)


add_library(SQLite SHARED sqlite3.c)
target_include_directories(SQLite PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

if(MSVC)
	target_compile_definitions(SQLite PRIVATE SQLITE_API=__declspec(dllexport))
	set_target_properties(SQLite PROPERTIES PREFIX "")
endif()

if(UNIX AND NOT APPLE)
	set_target_properties(SQLite PROPERTIES PREFIX "")
	target_link_libraries(SQLite PRIVATE dl pthread)

endif()

