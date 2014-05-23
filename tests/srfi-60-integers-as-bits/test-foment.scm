#! /usr/bin/env foment

(import (scheme base)
        (scheme write)
        (srfi 60))
(include "test-common.scm")
(display (main-program))
(newline)
