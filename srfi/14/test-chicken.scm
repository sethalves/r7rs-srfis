#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))

;; (include "snow/srfi-14-character-sets.sld")
;; (import (snow srfi-14-character-sets))
(import (srfi 14))

(include "test-common.scm")

(display (main-program))
(newline)
