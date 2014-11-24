#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

;; sudo chicken-install srfi-37

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "srfi/37/tests.sld")
(import (srfi-tests 37 tests))
(display (run-tests))
(newline)
