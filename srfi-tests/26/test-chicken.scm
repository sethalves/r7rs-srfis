#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base)
        (scheme write))
(include "srfi/26.sld")
(include "srfi/26/tests.sld")
(import (srfi-tests 26 tests))
(display (run-tests))
(newline)
