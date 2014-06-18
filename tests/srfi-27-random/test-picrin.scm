#! /bin/sh
#| -*- scheme -*-
exec picrin $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme file)
        ;; (scheme repl)
        ;; (scheme r5rs)
        (srfi 27))
(include "test-common.scm")
(display (main-program))
(newline)
