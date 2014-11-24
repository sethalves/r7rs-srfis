#! /bin/sh
#| -*- scheme -*-
exec sash -A . -F .sld $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme file)
        (srfi 26 tests))
(display (run-tests))
(newline)
