#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)

(use srfi-4)
;; (include "srfi/1.sld")
(import (scheme base)
        (srfi 1))

(include "test-common.scm")

(display (main-program))
(newline)
