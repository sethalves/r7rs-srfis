#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

;; sudo chicken-install srfi-106

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "srfi/42.sld")
(include "srfi/78.sld")
(include "srfi-ancillary/106/constants.sld")
(include "srfi-ancillary/106/impl-chicken.sld")
(include "srfi-ancillary/106/interface.sld")
(include "srfi/106.sld")
(include "srfi-tests/106/tests.sld")
(import (srfi-tests 106 tests))
(display (run-tests))
(newline)
