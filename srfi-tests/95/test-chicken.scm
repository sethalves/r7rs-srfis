#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "srfi-tests/95/tests.sld")
(import (srfi-tests 95 tests))
(display (run-tests))
(newline)
