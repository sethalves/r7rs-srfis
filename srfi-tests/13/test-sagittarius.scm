#! /bin/sh
#| -*- scheme -*-
exec sash -L . -F .sld $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi-tests 13 tests))
(display (run-tests))
(newline)
