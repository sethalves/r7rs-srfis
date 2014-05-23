#! /bin/sh
#| -*- scheme -*-
exec sash -L . -S .sld $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme time)
        (srfi 19))
(include "test-common.scm")
(display (main-program))
(newline)
