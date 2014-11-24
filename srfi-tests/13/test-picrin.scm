#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme char)
        (srfi-tests 13 tests))
(display (run-tests))
(newline)

