#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi-tests 69 tests))
(display (run-tests))
(newline)
