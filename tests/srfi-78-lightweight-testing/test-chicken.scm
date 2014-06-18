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
(import (srfi 42)
        (srfi 78))
(include "test-common.scm")
(display (main-program))
(newline)
