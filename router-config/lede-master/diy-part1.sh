#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Uncomment a feed source
# sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default
# sed -i 's/\"#src-git\"/\"src-git\"/g' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

sed -i 's/192.168.1.1/192.168.66.1/g' package/base-files/files/bin/config_generate

sed -i '5i src-git kenzo https://github.com/kenzok8/openwrt-packages\nsrc-git small https://github.com/kenzok8/small\nsrc-git amlogic https://github.com/ophub/luci-app-amlogic' feeds.conf.default

sed -i "751i \\\t\t<tr><td width=\"33%\"><%:Author HomePage%></td><td>https://hexo.niliovo.top</td></tr>" package/lean/autocore/files/x86/index.htm

sed -i "742i \\\t\t<tr><td width=\"33%\"><%:Author HomePage%></td><td>https://hexo.niliovo.top</td></tr>" package/lean/autocore/files/arm/index.htm

echo "
NNNNNNNN        NNNNNNNNIIIIIIIIIILLLLLLLLLLL             IIIIIIIIII
N:::::::N       N::::::NI::::::::IL:::::::::L             I::::::::I
N::::::::N      N::::::NI::::::::IL:::::::::L             I::::::::I
N:::::::::N     N::::::NII::::::IILL:::::::LL             II::::::II
N::::::::::N    N::::::N  I::::I    L:::::L                 I::::I  
N:::::::::::N   N::::::N  I::::I    L:::::L                 I::::I  
N:::::::N::::N  N::::::N  I::::I    L:::::L                 I::::I  
N::::::N N::::N N::::::N  I::::I    L:::::L                 I::::I  
N::::::N  N::::N:::::::N  I::::I    L:::::L                 I::::I  
N::::::N   N:::::::::::N  I::::I    L:::::L                 I::::I  
N::::::N    N::::::::::N  I::::I    L:::::L                 I::::I  
N::::::N     N:::::::::N  I::::I    L:::::L         LLLLLL  I::::I  
N::::::N      N::::::::NII::::::IILL:::::::LLLLLLLLL:::::LII::::::II
N::::::N       N:::::::NI::::::::IL::::::::::::::::::::::LI::::::::I
N::::::N        N::::::NI::::::::IL::::::::::::::::::::::LI::::::::I
NNNNNNNN         NNNNNNNIIIIIIIIIILLLLLLLLLLLLLLLLLLLLLLLLIIIIIIIIII

Power By Nili		HomePage https://hexo.niliovo.top
───────────────────────────────────────────────────────────────────────

" > package/base-files/files/etc/banner
