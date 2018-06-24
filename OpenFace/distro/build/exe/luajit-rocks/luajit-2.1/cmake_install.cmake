# Install script for directory: /home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/lee/OpenFace/distro/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/luaconf.h"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/lua.h"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/lauxlib.h"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/lualib.h"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/lua.hpp"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/luajit.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libluajit.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libluajit.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libluajit.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/lee/OpenFace/distro/build/exe/luajit-rocks/luajit-2.1/libluajit.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libluajit.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libluajit.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libluajit.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luajit" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luajit")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luajit"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/lee/OpenFace/distro/build/exe/luajit-rocks/luajit-2.1/luajit")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luajit" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luajit")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/luajit")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/jit" TYPE FILE FILES
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/bc.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/v.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/dump.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/dis_x86.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/dis_x64.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/dis_arm.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/dis_ppc.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/dis_mips.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/dis_mipsel.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/bcsave.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/bc.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/p.lua"
    "/home/lee/OpenFace/distro/exe/luajit-rocks/luajit-2.1/src/jit/zone.lua"
    "/home/lee/OpenFace/distro/build/exe/luajit-rocks/luajit-2.1/vmdef.lua"
    )
endif()

