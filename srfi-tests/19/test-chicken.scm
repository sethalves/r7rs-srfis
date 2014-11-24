#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base)
        (scheme time))
(include "srfi/19/tests.sld")
(import (srfi-tests 19 tests))
(display (run-tests))
(newline)
