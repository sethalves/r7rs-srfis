#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "srfi/14/tests.sld")
(import (srfi 14 tests))
(display (run-tests))
(newline)
