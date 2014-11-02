#!/bin/sh
#|
export CLASSPATH=/usr/local/lib/kawa.jar 
exec java kawa.repl "$0" "$*"
|#


(import (scheme base)
        (scheme write)
        (srfi 60 tests))
(display (run-tests))
(newline)
