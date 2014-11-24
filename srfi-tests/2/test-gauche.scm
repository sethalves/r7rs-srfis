#! /bin/sh
#| -*- scheme -*-
exec gosh \
-e '(append! *load-suffixes* (list ".sld"))' \
-e '(append! *load-path* (list "."))' \
-r7 $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi-tests 2 tests))
(display (run-tests))
(newline)
