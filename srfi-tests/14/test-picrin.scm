#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi-tests 14 tests))
(display (run-tests))
(newline)
