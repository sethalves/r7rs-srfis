#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(use srfi-4)
(import (scheme base))
(include "srfi/1/tests.sld")
(import (srfi 1 tests))
(display (run-tests))
(newline)
