#! /bin/sh
#| -*- scheme -*-
exec sash -A . -F .sld $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme read)
        (scheme write)
        (scheme file)
        (srfi 42))
(include "test-common.scm")
(display (main-program))
(newline)
