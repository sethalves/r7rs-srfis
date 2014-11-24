#! /bin/sh
#| -*- scheme -*-
exec foment $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme time)
        (srfi-tests 19 tests))
(display (run-tests))
(newline)
