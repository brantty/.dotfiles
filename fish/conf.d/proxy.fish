#!/usr/bin/env fish

set -Ux http_proxy 'http://localhost:8889'
set -Ux https_proxy $http_proxy
set -Ux HTTP_PROXY $http_proxy
set -Ux HTTPS_PROXY $https_proxy
set -Ux socks_proxy 'socks://localhost:1089'
set -Ux socks4_proxy 'socks4://localhost:1089'
set -Ux socks5_proxy 'socks5://localhost:1089'
set -Ux SOCKS_PROXY $socks_proxy
set -Ux SOCKS4_PROXY $socks4_proxy
set -Ux SOCKS5_PROXY $socks5_proxy
