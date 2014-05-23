#! /bin/sh
#| -*- scheme -*-
exec foment $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi 27))
(include "test-common.scm")
(display (main-program))
(newline)
