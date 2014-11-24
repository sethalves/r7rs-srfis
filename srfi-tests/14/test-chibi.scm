#! /bin/sh
#| -*- scheme -*-
CHIBI_MODULE_PATH="" exec chibi-scheme -A . -s $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi-tests 14 tests))
(display (run-tests))
(newline)
