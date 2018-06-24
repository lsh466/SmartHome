# Install script for directory: /home/lee/OpenFace/distro/exe/luajit-rocks/luarocks

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/add.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/admin_remove.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/build" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/build/builtin.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/build" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/build/cmake.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/build" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/build/command.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/build" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/build/make.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/build.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/cache.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/cfg.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/command_line.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/config_cmd.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/deps.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/dir.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/doc.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/download.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/cvs.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/git.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/git_file.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/git_http.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/git_https.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/hg.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/hg_http.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/hg_https.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/hg_ssh.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/sscm.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fetch" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch/svn.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fetch.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fs" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fs/lua.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fs/unix" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fs/unix/tools.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fs" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fs/unix.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fs/win32" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fs/win32/tools.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/fs" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fs/win32.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/fs.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/help.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/index.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/install.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/lint.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/list.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/loader.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/make.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/make_manifest.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/manif.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/manif_core.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/new_version.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/pack.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/path.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/path_cmd.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/persist.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/purge.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/refresh_cache.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/remove.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/repos.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/require.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/search.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/show.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/tools" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/tools/patch.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/tools" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/tools/tar.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/tools" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/tools/zip.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/type_check.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/unpack.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/upload" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/upload/api.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks/upload" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/upload/multipart.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/upload.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/util.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/validate.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/exe/luajit-rocks/luarocks/src/luarocks/write_rockspec.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lua/5.1/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/build/exe/luajit-rocks/luarocks/src/luarocks/site_config.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/luarocks" TYPE FILE FILES "/home/lee/OpenFace/distro/build/exe/luajit-rocks/luarocks/src/luarocks/config.lua")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/home/lee/OpenFace/distro/build/exe/luajit-rocks/luarocks/src/bin/luarocks")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/home/lee/OpenFace/distro/build/exe/luajit-rocks/luarocks/src/bin/luarocks-admin")
endif()

