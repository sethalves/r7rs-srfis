#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme char)
        (srfi 13)
        (srfi 14))
(include "test-common.scm")
(display (main-program))
(newline)
