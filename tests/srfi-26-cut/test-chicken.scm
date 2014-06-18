#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base)
        (scheme write))
(include "srfi/26.sld")
(import (srfi 26))
(include "test-common.scm")
(display (main-program))
(newline)
