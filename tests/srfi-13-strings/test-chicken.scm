#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)

;; (include "snow/srfi-13-strings.sld")
;; (import (snow srfi-13-strings))
(import (srfi 13))

(include "test-common.scm")

(display (main-program))
(newline)
