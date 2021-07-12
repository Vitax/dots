function hellogo

set -l filename "hello.go"

if not set -q argv[1]
	set filename argv[1]
end

cat >$filename<<EOF
/*
 *
 * http://github.com/vitax
 *
 * [automatically generated template text]
 * 
 */

package main

import (
    "fmt"
)

func main() {
    fmt.Println("hi")
}
EOF
end

function hellocpp

set -l filename "hello.cpp"

if not set -q argv[1]
	set filename argv[1]
end

cat >"$filename<<EOF
/*
 *
 * http://github.com/vitax
 *
 * [automatically generated template text]
 * 
 */

#include <iostream>

int main() {
    printf("%s\n", "hi");
    return 0;
}
EOF
end

function helloc

set -l filename "hello.c"

if not set -q argv[1]
	set filename argv[1]
end

cat >$filename<<EOF
/*
 *
 * http://github.com/vitax
 *
 * [automatically generated template text]
 * 
 */

#include <stdio.h>

int main() {
    printf("%s\n", "hi");
    return 0;
}
EOF
end

# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/

functino hellopy
set -l filename "hello.py"

if not set -q argv[1]
	set filename argv[1]
end

cat >$filename<<EOF
#!/usr/bin/env python3
#
# https://github.com/vitax
#
# [automatically generated template text]
#


def main():
    print("hi")


if __name__ == "__main__":
    main()
EOF
chmod +x "${argv[1]:-hello.py}"
}

# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/

hellosh() {

set -l filename "hello.sh"

if not set -q argv[1]
	set filename argv[1]
end

cat >"$filename<<EOF
#!/bin/sh
#
# http://github.com/vitax
#
# [automatically generated template text]
#

usage() {
    >&2 printf '%s\n' "Usage: ${0##*/} []"
    exit 1
}

main() {
    echo hi
}

main "$@"
EOF
chmod +x "${argv[1]:-hello.sh}"
end

# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/

function hellomk

set -l filename "Makefile"

if not set -q argv[1]
	set filename argv[1]
end

cat >"$filename<<EOF
PREFIX = /usr/local
CFLAGS = -O2 -pipe -fstack-protector-strong
BIN = hello

all:
	:

install:
	install -D -m 0755 ${BIN} ${DESTDIR}${PREFIX}/bin/${BIN}

uninstall:
	rm ${DESTDIR}${PREFIX}/bin/${BIN}

test:
	:
EOF
end
