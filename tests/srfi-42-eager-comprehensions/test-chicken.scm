#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)

(import (scheme base)
        (scheme char)
        (scheme read)
        (scheme write)
        (scheme file))
(include "srfi/42.sld")
(import (srfi 42))
(include "test-common.scm")
(display (main-program))
(newline)
