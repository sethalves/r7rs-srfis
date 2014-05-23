#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

;; sudo chicken-install srfi-37

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base)
        (scheme process-context)
        (srfi 37))
(include "test-common.scm")
(main-program (command-line))
