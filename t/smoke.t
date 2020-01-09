#!/usr/bin/env bash

# Copyright © 2020 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

set -e -u
pdir="${0%/*}/.."
prog="$pdir/momaca"
echo 1..2
out=$("$prog" --help)
if [ -n "$out" ]
then
    echo 'ok 1'
else
    echo 'not ok 1'
fi
xout='98.07'
out=$("$prog" H2SO4)
say() { printf "%s\n" "$@"; }
diff=$(diff -u <(say "$xout") <(say "$out")) || true
if [ -z "$diff" ]
then
    echo 'ok 2'
else
    sed -e 's/^/# /' <<< "$diff"
    echo 'not ok 2'
fi

# vim:ts=4 sts=4 sw=4 et ft=sh
