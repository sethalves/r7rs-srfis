#! /bin/sh
#| -*- scheme -*-
CHIBI_MODULE_PATH="" exec chibi-scheme -A . -s $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi 14))
(include "test-common.scm")
(display (main-program))
(newline)
