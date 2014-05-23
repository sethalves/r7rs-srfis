#! /bin/sh
#| -*- scheme -*-
exec gosh \
-e '(append! *load-suffixes* (list ".sld"))' \
-e '(append! *load-path* (list "."))' \
-ftest -r7 $0 "$@"
|#

(import (scheme base) (scheme write) (scheme char))
(import (srfi 14))
(import (srfi 13))
(include "test-common.scm")
(display (main-program))
(newline)
