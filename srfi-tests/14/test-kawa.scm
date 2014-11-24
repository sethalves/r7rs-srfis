#! /bin/sh
#| -*- scheme -*-
exec /usr/local/bin/kawa \
  -Dkawa.import.path="./*.sld" \
  $0 "$@"
|#

(import (scheme base)
        (scheme char)
        (scheme write)
        (srfi-tests 14 tests))
(display (run-tests))
(newline)
