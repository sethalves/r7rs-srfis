#!/bin/sh
export GUILE_AUTO_COMPILE=0
exec guile --debug --no-auto-compile -s "$0" "$*"
!#

(import (scheme base)
        (scheme write)
        (srfi 60 tests))
(display (run-tests))
(newline)
