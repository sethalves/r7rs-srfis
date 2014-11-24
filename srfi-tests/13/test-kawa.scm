#! /bin/sh
#| -*- scheme -*-
exec /usr/local/bin/kawa \
  -Dkawa.import.path="./*.sld" \
  $0 "$@"
|#

(import (scheme base)
        (scheme write)
        (scheme char)
        (srfi-tests 13 tests))
(display (run-tests))
(newline)
