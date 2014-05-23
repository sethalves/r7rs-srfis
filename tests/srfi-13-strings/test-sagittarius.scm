#! /bin/sh
#| -*- scheme -*-
exec sash -L . -S .sld $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi 13)
        (srfi 14))
(include "test-common.scm")
(display (main-program))
(newline)
