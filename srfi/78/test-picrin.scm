#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi 78 tests))
(display (run-tests))
(newline)