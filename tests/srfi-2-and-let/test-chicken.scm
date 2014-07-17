#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)

(use srfi-4)
(include "srfi/2.sld")
(include "srfi/42.sld")
(include "srfi/78.sld")
(import (scheme base)
        (srfi 2)
        (srfi 42)
        (srfi 78))

(include "test-common.scm")

(display (main-program))
(newline)
