#! /bin/sh
#| -*- scheme -*-
exec sash -A . -S .sld $0 "$@"
|#

;; exec sash -L . -S .sld $0 "$@"
;; exec sash -L . -L /usr/local/share/sagittarius/0.5.1/sitelib -S .sld $0 "$@"

(import (scheme base)
        (scheme write)
        (srfi 1))
(include "test-common.scm")
(display (main-program))
(newline)
