#! /usr/bin/env chibi-scheme

(import (scheme base)
        (scheme write)
        (srfi 29 tests))
(display (run-tests))
(newline)
