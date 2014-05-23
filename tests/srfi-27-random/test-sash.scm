#! /bin/sh
#| -*- scheme -*-
exec sash -L . -S .sld $0 "$@"
|#

(import (scheme base) (scheme write))
(import (srfi 27))
(include "test-common.scm")
(display (main-program))
(newline)
