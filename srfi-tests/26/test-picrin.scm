#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme file)
        (srfi-tests 26 tests))
(display (run-tests))
(newline)
