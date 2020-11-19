#!/bin/bash

cwd=~/Documents/main/
escape_cwd=$(printf "%q" "~/Documents/main/")
gvim \
    -u "${cwd}/.vimrc" \
    --cmd "let g:exvim_custom_path='${cwd}'" \
    --cmd "set runtimepath=${escape_cwd}/vimfiles,\$VIMRUNTIME,${escape_cwd}/vimfiles/after" \
    ${1:+"$@"}
