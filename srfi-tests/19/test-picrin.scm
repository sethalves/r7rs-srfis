#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme time)
        (srfi 19 tests))
(display (run-tests))
(newline)
