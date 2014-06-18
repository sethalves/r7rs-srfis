#! /bin/sh
#| -*- scheme -*-
exec foment $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme file)
        (srfi 26))
(include "test-common.scm")
(display (main-program))
(newline)
