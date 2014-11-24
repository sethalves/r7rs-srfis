#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(use srfi-4)
(import (scheme base))
(include "srfi/42.sld")
(include "srfi/78.sld")
(include "srfi/2.sld")
(include "srfi/2/tests.sld")
(import (srfi 2 tests))
(display (run-tests))
(newline)
