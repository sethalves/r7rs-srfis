#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (srfi 29))
(include "test-common.scm")
(display (main-program))
(newline)
