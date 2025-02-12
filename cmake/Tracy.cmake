# Enable on command-line with 'cmake -DTRACY_ENABLE=ON ..'

option(TRACY_ENABLE "Enable Tracy profiling." OFF)

# Also handle close flags:
if (ENABLE_TRACY OR TRACY_ENABLED OR TRACY)
    set(TRACY_ENABLE ON)
endif()

message(STATUS "TRACY_ENABLE: ${TRACY_ENABLE}")

if(TRACY_ENABLE)
    # Download dev libs
    set(TRACY_LINK https://github.com/wolfpld/tracy/archive/v0.8.1.tar.gz)
    if(NOT EXISTS ${CMAKE_SOURCE_DIR}/ext/tracy/tracy-0.8.1/TracyClient.cpp)
        message(STATUS "Downloading Tracy development library")
        file(MAKE_DIRECTORY ${CMAKE_SOURCE_DIR}/tracy)
        file(DOWNLOAD
                ${TRACY_LINK}
                ${CMAKE_SOURCE_DIR}/ext/tracy/tracy.tar.gz
                TIMEOUT 60)
        execute_process(COMMAND "${CMAKE_COMMAND}" -E
                tar xvf "${CMAKE_SOURCE_DIR}/ext/tracy/tracy.tar.gz"
                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/ext/tracy)

        # Download client
        message(STATUS "Downloading Tracy client")
        file(DOWNLOAD
            https://github.com/wolfpld/tracy/releases/download/v0.8.1/Tracy-0.8.1.7z
            ${CMAKE_SOURCE_DIR}/tracy.tar.gz
            TIMEOUT 60)
            execute_process(COMMAND "${CMAKE_COMMAND}" -E
                    tar xvf "${CMAKE_SOURCE_DIR}/tracy.tar.gz"
                    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/)
    endif()

    add_library(tracy_client ${CMAKE_SOURCE_DIR}/ext/tracy/tracy-0.8.1/TracyClient.cpp)
    target_include_directories(tracy_client PUBLIC ${CMAKE_SOURCE_DIR}/ext/tracy/tracy-0.8.1/)
    target_compile_definitions(tracy_client
        PUBLIC
            TRACY_ENABLE
            TRACY_ON_DEMAND
            TRACY_NO_EXIT
            TRACY_NO_BROADCAST
            TRACY_NO_SYSTEM_TRACING
            TRACY_TIMER_QPC)

    if(MSVC AND CMAKE_SIZEOF_VOID_P EQUAL 4)
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /LARGEADDRESSAWARE")
    endif()
endif(TRACY_ENABLE)
