#! /bin/sh
#| -*- scheme -*-
exec gosh \
-e '(append! *load-suffixes* (list ".sld"))' \
-e '(append! *load-path* (list "."))' \
-ftest -r7 $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi 95)
        (srfi 95-gauche))
(include "test-common.scm")
(display (main-program))
(newline)
