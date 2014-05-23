#! /bin/sh
#| -*- scheme -*-
CHIBI_MODULE_PATH="" exec chibi-scheme -A . -s $0 "$@"
|#


(import (scheme base)
        (scheme write)
        (scheme char))
(import (chibi char-set)
        (chibi char-set full))
;; (import (snow srfi-13-strings))
(import (srfi 13))

(include "test-common.scm")

(display (main-program))
(newline)

