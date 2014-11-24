#! /bin/sh
#| -*- scheme -*-
CHIBI_MODULE_PATH="" exec chibi-scheme -A . -s $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme char)
        (chibi char-set)
        (chibi char-set full)
        (srfi-tests 13 tests))
(display (run-tests))
(newline)
