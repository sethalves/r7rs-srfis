(repository
  (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/index.scm")
  (name "r7rs srfis")
  (package
    (name ())
    (version "1.0")
    (url "srfi-2-and-let.tgz")
    (size 8192)
    (checksum (md5 "7f704a1a6b3a15437f802c23b141f9e7"))
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
      (name (srfi 2 tests))
      (path "srfi/2/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-2")
      (license bsd)
      (depends (srfi 78) (srfi 42) (srfi 2))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-42-eager-comprehensions.tgz")
    (size 62976)
    (checksum (md5 "d20c55770fcd078ac8cb4eb074d952ce"))
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
      (name (srfi 42 tests))
      (path "srfi/42/tests.sld")
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
    (url "srfi-78-lightweight-testing.tgz")
    (size 16896)
    (checksum (md5 "c77d19f1bdc3967a6a5ca22852e523f3"))
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
      (name (srfi 78 tests))
      (path "srfi/78/tests.sld")
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
    (url "srfi-26-cut.tgz")
    (size 9728)
    (checksum (md5 "3f0e0fc19c7541512370908ed5b3388b"))
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
      (name (srfi 26 tests))
      (path "srfi/26/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "26")
      (license bsd)
      (depends (srfi 26))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-27-random.tgz")
    (size 39936)
    (checksum (md5 "19325dbfb5a4ebf8f303dea6214a144f"))
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
      (name (srfi 27 tests))
      (path "srfi/27/tests.sld")
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
    (url "srfi-1-lists.tgz")
    (size 30208)
    (checksum (md5 "468df690aa0330e5f35a73d92976155e"))
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
      (name (srfi 1 tests))
      (path "srfi/1/tests.sld")
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
    (url "srfi-69-hash-tables.tgz")
    (size 23552)
    (checksum (md5 "d1de90cba2a6c032f875946197d4ec0b"))
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
      (name (srfi 69 tests))
      (path "srfi/69/tests.sld")
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
    (url "srfi-13-strings.tgz")
    (size 26624)
    (checksum (md5 "029b11c5e4e93ce4346949ff14dde170"))
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
      (name (srfi 13 tests))
      (path "srfi/13/tests.sld")
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
    (url "srfi-95-sort.tgz")
    (size 15872)
    (checksum (md5 "9cee62b82a34aee1ddce4dd6461f83c3"))
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
      (name ("."))
      (path "srfi/gauche-95.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-95 shim for gauche")
      (license public-domain)
      (depends)
      (use-for final))
    (library
      (name (srfi 95 tests))
      (path "srfi/95/tests.sld")
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
    (url "srfi-19-time.tgz")
    (size 70656)
    (checksum (md5 "fbfc95bb4916d24dfacf882fee9a01a9"))
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
      (name (srfi 19 tests))
      (path "srfi/19/tests.sld")
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
    (url "srfi-60-integers-as-bits.tgz")
    (size 15360)
    (checksum (md5 "dd4540dfe7aaf6403cad21cb14261d13"))
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
      (name (srfi 60 tests))
      (path "srfi/60/tests.sld")
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
    (url "srfi-29-format.tgz")
    (size 14336)
    (checksum (md5 "2d1ccc1e5dd4b836775bb37628399051"))
    (library
      (name (srfi 29))
      (path "srfi/29.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-29/srfi-29.html")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Scott G. Miller")
      (description "Localization / format")
      (license mit)
      (depends (srfi 29))
      (use-for final))
    (library
      (name (srfi 29 tests))
      (path "srfi/29/tests.sld")
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
    (url "srfi-14-character-sets.tgz")
    (size 52224)
    (checksum (md5 "5be86b19a7f581c3232fc7fbf02cd4e9"))
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
      (name (srfi 14 tests))
      (path "srfi/14/tests.sld")
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
    (url "srfi-37-argument-processor.tgz")
    (size 19456)
    (checksum (md5 "e8b8ec5550856c9f982f0c80d9d73407"))
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
      (name (srfi 37 tests))
      (path "srfi/37/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for srfi-37")
      (license bsd)
      (depends (srfi 37))
      (use-for test))))
