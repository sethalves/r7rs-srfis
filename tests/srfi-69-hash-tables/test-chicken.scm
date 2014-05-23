#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base)
        (scheme write)
        (srfi 69))
(include "test-common.scm")
(display (main-program))
(newline)
