#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(include "srfi-tests/13/tests.sld")
(import (srfi-tests 13 tests))
(display (run-tests))
(newline)
