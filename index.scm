(repository
  (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/index.scm")
  (name "r7rs srfis")
  (package
    (name ())
    (version "1.0")
    (url "srfi-78-lightweight-testing.tgz")
    (size 17408)
    (checksum (md5 "d2dd2ec1c75f1123472d09c000cda226"))
    (library
      (name (srfi 78))
      (path "srfi/78.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-78/srfi-78.html")
        (else "http://srfi.schemers.org/srfi-78/srfi-78.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Sebastian Egner")
      (description "Lightweight testing")
      (license bsd)
      (depends (srfi 42))
      (use-for final))
    (library
      (name (srfi-tests 78 tests))
      (path "srfi-tests/78/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Sebastian Egner")
      (description "78")
      (license bsd)
      (depends (srfi 42) (srfi 78))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-95-sort.tgz")
    (size 16384)
    (checksum (md5 "dcc743dc66a850d4233c68dad724f8dc"))
    (library
      (name (srfi 95))
      (path "srfi/95.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-95/srfi-95.html")
        (else "http://srfi.schemers.org/srfi-95/srfi-95.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Aubrey Jaffer" "Richard A. O'Keefe" "D.H.D. Warren")
      (description "Sorting and Merging")
      (license public-domain)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 95 tests))
      (path "srfi-tests/95/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "95")
      (license bsd)
      (depends (srfi 95))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-13-strings.tgz")
    (size 27648)
    (checksum (md5 "b04bfc148853ea874809381162672065"))
    (library
      (name (srfi 13))
      (path "srfi/13.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-13/srfi-13.html")
        (else "http://srfi.schemers.org/srfi-13/srfi-13.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors)
      (description "srfi-13-strings")
      (license BSD-style)
      (depends (chibi optional) (srfi 14))
      (use-for final))
    (library
      (name (srfi-tests 13 tests))
      (path "srfi-tests/13/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-13")
      (license bsd)
      (depends (srfi 13) (srfi 14))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-19-time.tgz")
    (size 71168)
    (checksum (md5 "925fd4be75c5e8326a53dce9df2c702a"))
    (library
      (name (srfi 19))
      (path "srfi/19.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-19/srfi-19.html")
      (manual
        (en "http://srfi.schemers.org/srfi-19/srfi-19.html")
        (else "http://srfi.schemers.org/srfi-19/srfi-19.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Will Fitzgerald" "Neodesic Corporation")
      (description "srfi-19-time")
      (license BSD-style)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 19 tests))
      (path "srfi-tests/19/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-19")
      (license bsd)
      (depends (srfi 19))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-106-basic-socket-interface.tgz")
    (size 40960)
    (checksum (md5 "55ccd89b4178018eab10acc589e12ef0"))
    (library
      (name (srfi 106))
      (path "srfi/106.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-106/srfi-106.html")
        (else "http://srfi.schemers.org/srfi-106/srfi-106.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi-ancillary 106 constants) (srfi-ancillary 106 interface))
      (use-for final))
    (library
      (name (srfi-ancillary 106 interface))
      (path "srfi-ancillary/106/interface.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends
        (srfi-ancillary 106 constants)
        (srfi-ancillary 106 impl-chibi)
        (srfi-ancillary 106 impl-chicken)
        (srfi-ancillary 106 impl-kawa)
        (srfi-ancillary 106 unimplemented))
      (use-for final))
    (library
      (name (srfi-ancillary 106 constants))
      (path "srfi-ancillary/106/constants.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi 1))
      (use-for final))
    (library
      (name (srfi-ancillary 106 unimplemented))
      (path "srfi-ancillary/106/unimplemented.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi-ancillary 106 constants))
      (use-for final))
    (library
      (name (srfi-ancillary 106 impl-chibi))
      (path "srfi-ancillary/106/impl-chibi.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi-ancillary 106 constants))
      (use-for final))
    (library
      (name (srfi-ancillary 106 impl-chicken))
      (path "srfi-ancillary/106/impl-chicken.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi-ancillary 106 constants))
      (use-for final))
    (library
      (name (srfi-ancillary 106 impl-kawa))
      (path "srfi-ancillary/106/impl-kawa.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi-ancillary 106 constants))
      (use-for final))
    (library
      (name (srfi-tests 106 tests))
      (path "srfi-tests/106/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-106")
      (license bsd)
      (depends (srfi 27) (srfi 106) (srfi 78))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-18-multithreading.tgz")
    (size 47616)
    (checksum (md5 "9d8db5b0bfb98cadf8e3ba3ad3440ebc"))
    (library
      (name (srfi 18))
      (path "srfi/18.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-18/srfi-18.html")
        (else "http://srfi.schemers.org/srfi-18/srfi-18.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "Multithreading support")
      (license bsd)
      (depends (srfi-ancillary 18 faux))
      (use-for final))
    (library
      (name (srfi-ancillary 18 faux))
      (path "srfi-ancillary/18/kawa.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "Kawa Multithreading support")
      (license bsd)
      (depends)
      (use-for final))
    (library
      (name (srfi-ancillary 18 faux))
      (path "srfi-ancillary/18/faux.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "Faux Multithreading support")
      (license bsd)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 18 tests))
      (path "srfi-tests/18/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "18")
      (license bsd)
      (depends (srfi 18) (srfi 78))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-69-hash-tables.tgz")
    (size 25088)
    (checksum (md5 "941c0d2c4fa11c9477b56c7f2945c47d"))
    (library
      (name (srfi 69))
      (path "srfi/69.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-69/srfi-69.html")
        (else "http://srfi.schemers.org/srfi-69/srfi-69.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Panu Kalliokoski")
      (description "Basic hash tables ")
      (license mit)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 69 tests))
      (path "srfi-tests/69/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "69")
      (license bsd)
      (depends (srfi 69))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-37-argument-processor.tgz")
    (size 19968)
    (checksum (md5 "1264ead682adc512e6c2a67b70e4facf"))
    (library
      (name (srfi 37))
      (path "srfi/37.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-37/srfi-37.html")
      (manual
        (en "http://srfi.schemers.org/srfi-37/srfi-37.html")
        (else "http://srfi.schemers.org/srfi-37/srfi-37.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Anthony Carrico")
      (description "args-fold: a program argument processor")
      (license bsd)
      (depends (srfi 1))
      (use-for final))
    (library
      (name (srfi-tests 37 tests))
      (path "srfi-tests/37/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-37")
      (license bsd)
      (depends (srfi 37))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-27-random.tgz")
    (size 40448)
    (checksum (md5 "70c40c506fb40f46c4c89544a4a48326"))
    (library
      (name (srfi 27))
      (path "srfi/27.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-27/srfi-27.html")
        (else "http://srfi.schemers.org/srfi-27/srfi-27.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Sebastian.Egner@philips.com")
      (description "Sources of Random Bits")
      (license bsd)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 27 tests))
      (path "srfi-tests/27/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-27")
      (license bsd)
      (depends (srfi 27))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-2-and-let.tgz")
    (size 8704)
    (checksum (md5 "104bae6af42539777c4dc39e0b00be99"))
    (library
      (name (srfi 2))
      (path "srfi/2.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-2/srfi-2.html")
        (else "http://srfi.schemers.org/srfi-2/srfi-2.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Alex Shinn")
      (description "srfi-2-and-let")
      (license BSD-style "http://synthcode.com/license.txt")
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 2 tests))
      (path "srfi-tests/2/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-2")
      (license bsd)
      (depends (srfi 2))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-42-eager-comprehensions.tgz")
    (size 63488)
    (checksum (md5 "d159f8805041b7a0ff9d81ef56bf71de"))
    (library
      (name (srfi 42))
      (path "srfi/42.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-42/srfi-42.html")
        (else "http://srfi.schemers.org/srfi-42/srfi-42.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Sebastian Egner")
      (description "Eager Comprehensions")
      (license public-domain)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 42 tests))
      (path "srfi-tests/42/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-42")
      (license bsd)
      (depends (srfi 42))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-14-character-sets.tgz")
    (size 52736)
    (checksum (md5 "48436325e3e47074f6a7e06f9a169cb1"))
    (library
      (name (srfi 14))
      (path "srfi/14.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-14/srfi-14.html")
        (else "http://srfi.schemers.org/srfi-14/srfi-14.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-14-character-sets")
      (license BSD-style)
      (depends (srfi 1) (srfi 60))
      (use-for final))
    (library
      (name (srfi-tests 14 tests))
      (path "srfi-tests/14/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Olin Shivers")
      (description "tests for srfi-14")
      (license bsd)
      (depends (srfi 14))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-29-format.tgz")
    (size 15360)
    (checksum (md5 "00fce60f39d4d483daeedae1a629842b"))
    (library
      (name (srfi 29))
      (path "srfi/29.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-29/srfi-29.html")
      (manual
        (en "http://srfi.schemers.org/srfi-29/srfi-29.html")
        (else "http://srfi.schemers.org/srfi-29/srfi-29.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Scott G. Miller")
      (description "Localization / format")
      (license mit)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 29 tests))
      (path "srfi-tests/29/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "29")
      (license bsd)
      (depends (srfi 29))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-60-integers-as-bits.tgz")
    (size 18432)
    (checksum (md5 "98cdc96c06e2b3645e4d8ca9e2961451"))
    (library
      (name (srfi 60))
      (path "srfi/60.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-60/srfi-60.html")
        (else "http://srfi.schemers.org/srfi-60/srfi-60.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Aubrey Jaffer")
      (description "Integers as Bits")
      (license mit)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 60 tests))
      (path "srfi-tests/60/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-60")
      (license bsd)
      (depends (srfi 60))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-1-lists.tgz")
    (size 30720)
    (checksum (md5 "5fe78a44664119a2cee8eb208935eca8"))
    (library
      (name (srfi 1))
      (path "srfi/1.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-1/srfi-1.html")
        (else "http://srfi.schemers.org/srfi-1/srfi-1.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Alex Shinn")
      (description "srfi-1-lists")
      (license BSD-style "http://synthcode.com/license.txt")
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 1 tests))
      (path "srfi-tests/1/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-1")
      (license bsd)
      (depends (srfi 1))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-26-cut.tgz")
    (size 10240)
    (checksum (md5 "4ea3021dc7c4b76eb96171d50bd2a0e5"))
    (library
      (name (srfi 26))
      (path "srfi/26.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual
        (en "http://srfi.schemers.org/srfi-26/srfi-26.html")
        (else "http://srfi.schemers.org/srfi-26/srfi-26.html"))
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Sebastian.Egner@philips.com")
      (description "Notation for Specializing Parameters without Currying")
      (license bsd)
      (depends)
      (use-for final))
    (library
      (name (srfi-tests 26 tests))
      (path "srfi-tests/26/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves/r7rs-srfis")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "26")
      (license bsd)
      (depends (srfi 26))
      (use-for test))))
