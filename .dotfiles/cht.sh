#!/usr/bin/env bash
languages=`echo "lua rust python" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
echo "selected $selected"
