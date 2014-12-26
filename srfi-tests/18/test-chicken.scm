#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base)
        (scheme write))
(include "srfi/42.sld")
(include "srfi/78.sld")
(include "srfi-ancillary/18/faux.sld")
(include "srfi-tests/18/tests.sld")
(import (srfi-tests 18 tests))
(display (run-tests))
(newline)
