#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme file)
        (srfi 27 tests))
(display (run-tests))
(newline)
