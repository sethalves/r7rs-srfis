#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)

(include "srfi/60.sld")
(import (srfi 60))

(include "test-common.scm")

(display (main-program))
(newline)
