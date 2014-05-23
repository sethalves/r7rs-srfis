#! /bin/sh
#| -*- scheme -*-
exec foment $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme char)
        (srfi 95))
(include "test-common.scm")
(display (main-program))
(newline)
