#! /bin/sh
#| -*- scheme -*-
exec foment $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (srfi 60))
(include "test-common.scm")
(display (main-program))
(newline)
