#! /bin/sh
#| -*- scheme -*-
exec foment $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi 14))
(include "test-common.scm")
(display (main-program))
(newline)
