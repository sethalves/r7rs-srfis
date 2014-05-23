#! /bin/sh
#| -*- scheme -*-
CHIBI_MODULE_PATH="" exec chibi-scheme -A . -s $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme process-context)
        (srfi 37))
(include "test-common.scm")
(main-program (command-line))
