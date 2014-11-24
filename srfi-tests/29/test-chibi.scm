#! /usr/bin/env chibi-scheme

(import (scheme base)
        (scheme write)
        (srfi-tests 29 tests))
(display (run-tests))
(newline)
