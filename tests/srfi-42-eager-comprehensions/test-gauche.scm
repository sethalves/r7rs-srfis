#! /bin/sh
#| -*- scheme -*-
exec gosh \
-e '(append! *load-suffixes* (list ".sld"))' \
-e '(append! *load-path* (list "."))' \
-ftest -r7 $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme read)
        (scheme write)
        (scheme file)
        (srfi 42))
(include "test-common.scm")
(display (main-program))
(newline)
