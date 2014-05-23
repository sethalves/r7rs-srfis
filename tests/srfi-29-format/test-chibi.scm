#! /usr/bin/env chibi-scheme

(import (scheme base)
        (scheme write)
        (srfi 29))
(include "test-common.scm")
(display (main-program))
(newline)
