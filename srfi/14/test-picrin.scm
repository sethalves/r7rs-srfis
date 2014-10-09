#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi 14))
(include "test-common.scm")
(display (main-program))
(newline)
