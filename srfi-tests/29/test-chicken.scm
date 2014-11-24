#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(include "srfi/29.sld")
(include "srfi/29/tests.sld")
(import (srfi-tests 29 tests))
(display (run-tests))
(newline)
