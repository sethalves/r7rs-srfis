#! /bin/sh
#| -*- scheme -*-
exec sash -A . -S .sld $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi 95))
(include "test-common.scm")
(display (main-program))
(newline)
