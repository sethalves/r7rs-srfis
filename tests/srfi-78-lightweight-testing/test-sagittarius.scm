#! /bin/sh
#| -*- scheme -*-
exec sash -A . -F .sld $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi 42)
        (srfi 78))
(include "test-common.scm")
(display (main-program))
(newline)