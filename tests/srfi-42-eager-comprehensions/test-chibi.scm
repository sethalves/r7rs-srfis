#! /bin/sh
#| -*- scheme -*-
CHIBI_MODULE_PATH="" exec chibi-scheme -A . -s $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme read)
        (scheme write)
        (scheme file)
        (srfi 42))
(include "test-common.scm")
(display (main-program))
(newline)