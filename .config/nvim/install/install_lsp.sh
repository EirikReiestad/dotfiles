#!/usr/bin/env bash

# Install language servers

# lua
lua_version=3.7.0
url=https://github.com/LuaLS/lua-language-server/releases/download

die() { echo "$*" && exit 1; }

case "$(uname -o)" in
  Darwin)
    filename="lua-language-server-${lua_version}-darwin-x64.tar.gz"
    ;;
  GNU/Linux)
    filename="lua-language-server-${lua_version}-linux-x64.tar.gz"
    ;;
  *)
    die "Unsupported OS!"
    ;;
esac

curl -sSL "${url}/${lua_version}/${filename}" |
  tar -C "${HOME}/.local" -xz --strip-components=1 -f -
