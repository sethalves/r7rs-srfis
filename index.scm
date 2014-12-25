(repository
  (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/index.scm")
  (name "r7rs srfis")
  (package
    (name ())
    (version "1.0")
    (url "srfi-78-lightweight-testing.tgz")
    (size 17408)
    (checksum (md5 "6ce6a20f35cd4432e7ef65e8bb22ad5a"))
    (library
      (name (srfi 78))
      (path "srfi/78.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-78/srfi-78.html")
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
      (homepage "https://github.com/sethalves")
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
    (size 15360)
    (checksum (md5 "f7eedfd3bc2bb92c284cd19641cbc3df"))
    (library
      (name (srfi 95))
      (path "srfi/95.sld")
      (version "1.0")
      (homepage
        "http://srfi.schemers.org/srfi-95/srfi-95.html"
        "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Aubrey Jaffer" "Richard A. O'Keefe" "D.H.D. Warren")
      (description "Sorting and Merging")
      (license public-domain)
      (depends (srfi 95))
      (use-for final))
    (library
      (name (srfi-tests 95 tests))
      (path "srfi-tests/95/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "eb2cb13b2413dfebf84a8827705ce27a"))
    (library
      (name (srfi 13))
      (path "srfi/13.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "1d728da4d9c099ef77a2020597e64aa9"))
    (library
      (name (srfi 19))
      (path "srfi/19.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-19/srfi-19.html")
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
      (homepage "https://github.com/sethalves")
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
    (size 38912)
    (checksum (md5 "d94f588be8546ccc71855039c6cb811f"))
    (library
      (name (srfi 106))
      (path "srfi/106.sld")
      (version "1.0")
      (homepage
        "http://srfi.schemers.org/srfi-106/srfi-106.html"
        "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi 1) (srfi-ancillary 106 interface))
      (use-for final))
    (library
      (name (srfi-ancillary 106 interface))
      (path "srfi-ancillary/106/interface.sld")
      (version "1.0")
      (homepage
        "http://srfi.schemers.org/srfi-106/srfi-106.html"
        "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends
        (srfi-ancillary 106 constants)
        (srfi-ancillary 106 impl-chibi)
        (srfi-ancillary 106 impl-chicken)
        (srfi-ancillary 106 unimplemented))
      (use-for final))
    (library
      (name (srfi-ancillary 106 constants))
      (path "srfi-ancillary/106/constants.sld")
      (version "1.0")
      (homepage
        "http://srfi.schemers.org/srfi-106/srfi-106.html"
        "https://github.com/sethalves")
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
      (homepage
        "http://srfi.schemers.org/srfi-106/srfi-106.html"
        "https://github.com/sethalves")
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
      (homepage
        "http://srfi.schemers.org/srfi-106/srfi-106.html"
        "https://github.com/sethalves")
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
      (homepage
        "http://srfi.schemers.org/srfi-106/srfi-106.html"
        "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "High and middle range of socket interfaces.")
      (license bsd)
      (depends (srfi-ancillary 106 constants))
      (use-for final))
    (library
      (name (srfi-ancillary 106 unimplemented))
      (path "srfi-ancillary/106/impl-kawa.sld")
      (version "1.0")
      (homepage
        "http://srfi.schemers.org/srfi-106/srfi-106.html"
        "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-106")
      (license bsd)
      (depends (srfi 27) (srfi 106) (srfi 78))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-69-hash-tables.tgz")
    (size 25088)
    (checksum (md5 "caf7ae01fed44afd63763918c1d13fa1"))
    (library
      (name (srfi 69))
      (path "srfi/69.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "e07203c4b6b92c7abd1a7f9cea092c71"))
    (library
      (name (srfi 37))
      (path "srfi/37.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-37/srfi-37.html")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "c7a10ccc2e4d0acacb23eac3b0ccff4b"))
    (library
      (name (srfi 27))
      (path "srfi/27.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "92199aa60923bb23fa684d4ada96667d"))
    (library
      (name (srfi 2))
      (path "srfi/2.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "db8a1d054a8aaa904bf94f95f60a05c4"))
    (library
      (name (srfi 42))
      (path "srfi/42.sld")
      (version "1.0")
      (homepage
        "http://srfi.schemers.org/srfi-42/srfi-42.html"
        "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "d114181ac481bc4e7041a2d9c71d4c1c"))
    (library
      (name (srfi 14))
      (path "srfi/14.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "a33ae1b7da724ca03d140e21da2d5511"))
    (library
      (name (srfi 29))
      (path "srfi/29.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-29/srfi-29.html")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "05a07e99d2ac5e8ccb67674261e353ab"))
    (library
      (name (srfi 60))
      (path "srfi/60.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "699d692dd09dff671a4d10c9d3c03a21"))
    (library
      (name (srfi 1))
      (path "srfi/1.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
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
    (checksum (md5 "4394be7b6880f1e3df48a84652f11cda"))
    (library
      (name (srfi 26))
      (path "srfi/26.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
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
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "26")
      (license bsd)
      (depends (srfi 26))
      (use-for test))))
