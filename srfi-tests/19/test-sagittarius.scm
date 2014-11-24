#! /bin/sh
#| -*- scheme -*-
exec sash -A . -F .sld $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme time)
        (srfi-tests 19 tests))
(display (run-tests))
(newline)
