#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)

(import (scheme base)
        (scheme write))
(include "srfi/42.sld")
(include "srfi/42/tests.sld")
(import (srfi 42 tests))
(display (run-tests))
(newline)