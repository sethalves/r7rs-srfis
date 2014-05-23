#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base)
        (scheme char)
        ;; (srfi 1)
        (srfi 95))
(include "test-common.scm")
(display (main-program))
(newline)
