#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi 42)
        (srfi 78))
(include "test-common.scm")
(display (main-program))
(newline)
