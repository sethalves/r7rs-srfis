#! /bin/sh
#| -*- scheme -*-
exec sash -A . -S .sld $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme process-context)
        (srfi 37))
(include "test-common.scm")
(main-program (command-line))
