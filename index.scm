(repository
  (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/index.scm")
  (name "r7rs srfis")
  (package
    (name ())
    (version "1.0")
    (url "srfi-2-and-let.tgz")
    (size 4096)
    (checksum (md5 "aaeb7570b64986278e3525262b265727"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-42-eager-comprehensions.tgz")
    (size 39936)
    (checksum (md5 "e67f0ba66246626d22e0cfa5cc14d159"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-78-lightweight-testing.tgz")
    (size 12288)
    (checksum (md5 "43ad33b2a0daab0af7bc2ec974d6af6d"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-26-cut.tgz")
    (size 7680)
    (checksum (md5 "06e6abf2b0ac2975a5f2faf651217e45"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-27-random.tgz")
    (size 27648)
    (checksum (md5 "ae9c50b69ffdf6ebdb0a0ce2b37796ae"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-1-lists.tgz")
    (size 28160)
    (checksum (md5 "fd69ca2d1c5611cf8772e3b73052c18f"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-69-hash-tables.tgz")
    (size 19456)
    (checksum (md5 "6fe240d1e9aca1f91d64ab1b4d15bc77"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-13-strings.tgz")
    (size 26624)
    (checksum (md5 "b9ff32af79de53efeca4076bc4ffc6a5"))
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
      (depends (srfi 13))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-95-sort.tgz")
    (size 13824)
    (checksum (md5 "3a569c31e42ccdab24e03fab3dbf6de8"))
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
      (name (srfi gauche-95))
      (path "srfi/gauche-95.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-95 shim for gauche")
      (license public-domain)
      (depends)
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-19-time.tgz")
    (size 70656)
    (checksum (md5 "b54fd33c6356227eba3260234a8b2e93"))
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
    (size 11776)
    (checksum (md5 "0afe7b9f1deaa2cf7a015e4024ee08cf"))
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
      (use-for final)))
  (package
    (name ())
    (version "1.0")
    (url "srfi-14-character-sets.tgz")
    (size 52224)
    (checksum (md5 "aebcfdaf040733f5d1487c6bc5537131"))
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
    (size 14336)
    (checksum (md5 "5f3251eb6d8d17f19e04511548928e62"))
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
      (use-for final))))
