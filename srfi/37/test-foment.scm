#! /bin/sh
#| -*- scheme -*-
exec foment $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi 37 tests))
(display (run-tests))
(newline)
