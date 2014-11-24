#! /bin/sh
#| -*- scheme -*-
exec sash -A . -F .sld $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi-tests 14 tests))
(display (run-tests))
(newline)
