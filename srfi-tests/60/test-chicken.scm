#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)

(import (scheme base)
        (numbers))

(include "srfi/60.sld")
(include "srfi/60/tests.sld")
(import (srfi-tests 60 tests))
(display (run-tests))
(newline)
