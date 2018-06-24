local site_config = {}

site_config.LUAROCKS_PREFIX=[[/home/lee/OpenFace/distro/install/]]
site_config.LUA_INCDIR=[[/home/lee/OpenFace/distro/install/include]]
site_config.LUA_LIBDIR=[[/home/lee/OpenFace/distro/install/lib]]
site_config.LUA_BINDIR=[[/home/lee/OpenFace/distro/install/bin]]
site_config.LUA_INTERPRETER = [[luajit]]
site_config.LUAROCKS_SYSCONFDIR=[[/home/lee/OpenFace/distro/install/etc/luarocks]]
site_config.LUAROCKS_ROCKS_TREE=[[/home/lee/OpenFace/distro/install/]]
site_config.LUAROCKS_ROCKS_SUBDIR=[[lib/luarocks/rocks]]
site_config.LUA_DIR_SET = true
site_config.LUAROCKS_UNAME_S=[[Linux]]
site_config.LUAROCKS_UNAME_M=[[x86_64]]
site_config.LUAROCKS_DOWNLOADER=[[wget]]
site_config.LUAROCKS_MD5CHECKER=[[md5sum]]

return site_config
