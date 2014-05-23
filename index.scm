(repository
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-27-random.tgz")
    (checksum (md5 "a002cb51e99d8b875f7d21d39fb0b580"))
    (library
      (name (srfi 27))
      (path "srfi/27.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Sebastian.Egner@philips.com")
      (description "Sources of Random Bits")
      (license bsd)
      (depends)))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-1-lists.tgz")
    (checksum (md5 "95396970c38789baa4a12cb3f0d13c0c"))
    (library
      (name (srfi 1))
      (path "srfi/1.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Alex Shinn")
      (description "srfi-1-lists")
      (license BSD-style "http://synthcode.com/license.txt")
      (depends)))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-69-hash-tables.tgz")
    (checksum (md5 "c67a2d2d8a69220cdc6a18e991a449bc"))
    (library
      (name (srfi 69))
      (path "srfi/69.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Panu Kalliokoski")
      (description "Basic hash tables ")
      (license mit)
      (depends)))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-13-strings.tgz")
    (checksum (md5 "3a8d7a524e656261621bdc2105ef8f84"))
    (library
      (name (srfi 13))
      (path "srfi/13.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors)
      (description "srfi-13-strings")
      (license BSD-style)
      (depends (srfi 14))))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-95-sort.tgz")
    (checksum (md5 "a81f35a7bb62f327697851d819ce1c74"))
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
      (depends (srfi 95)))
    (library
      (name (srfi 95-gauche))
      (path "srfi/95-gauche.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-95 shim for gauche")
      (license public-domain)
      (depends)))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-19-time.tgz")
    (checksum (md5 "7c8bf0678fce9074503f946d1b680fd7"))
    (library
      (name (srfi 19))
      (path "srfi/19.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-19/srfi-19.html")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Will Fitzgerald" "Neodesic Corporation")
      (description "srfi-19-time")
      (license BSD-style)
      (depends)))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-60-integers-as-bits.tgz")
    (checksum (md5 "46b135b266675b4bc01d27f38a94d4ba"))
    (library
      (name (srfi 60))
      (path "srfi/60.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Aubrey Jaffer")
      (description "Integers as Bits")
      (license mit)
      (depends)))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-29-format.tgz")
    (checksum (md5 "84a6fbf809258304d920896a7e277f0b"))
    (library
      (name (srfi 29))
      (path "srfi/29.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-29/srfi-29.html")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Scott G. Miller")
      (description "Localization / format")
      (license mit)
      (depends)))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-14-character-sets.tgz")
    (checksum (md5 "a8d3a53213985bbf06c8849325b5e128"))
    (library
      (name (srfi 14))
      (path "srfi/14.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-14-character-sets")
      (license BSD-style)
      (depends (srfi 1) (srfi 60))))
  (package
    (name ())
    (url "http://r7rs-srfis.s3-website-us-east-1.amazonaws.com/srfi-37-argument-processor.tgz")
    (checksum (md5 "2fe6c0579a5447cb4e3e26fb22ceed39"))
    (library
      (name (srfi 37))
      (path "srfi/37.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-37/srfi-37.html")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Anthony Carrico")
      (description "args-fold: a program argument processor")
      (license bsd)
      (depends (srfi 1))))
  (package
    (name ())
    (url "http://snow-repository.s3-website-us-east-1.amazonaws.com/srfi-14-character-sets.tgz")
    (size 39959)
    (checksum (md5 "5140f7ffe4d1d3d47e21d622d3913620"))
    (library
      (name (snow srfi-14-character-sets))
      (path "snow/srfi-14-character-sets.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-14-character-sets")
      (license BSD-style)
      (depends (snow srfi-60-integers-as-bits))))
  (package
    (name ())
    (url "http://snow-repository.s3-website-us-east-1.amazonaws.com/srfi-1-lists.tgz")
    (size 27159)
    (checksum (md5 "8172fb86e655b7a65e64ce6d991a8145"))
    (library
      (name (snow srfi-1-lists))
      (path "snow/srfi-1-lists.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors)
      (description "srfi-1-lists")
      (license olin-shivers-doesnt-care)
      (depends)))
  (package
    (name ())
    (url "http://snow-repository.s3-website-us-east-1.amazonaws.com/srfi-13-strings.tgz")
    (size 16407)
    (checksum (md5 "e2236aa87fc5c32ae137af13b9d416ab"))
    (library
      (name (snow srfi-13-strings))
      (path "snow/srfi-13-strings.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors)
      (description "srfi-13-strings")
      (license lgpl/v2.1)
      (depends (snow srfi-14-character-sets))))
  (package
    (name ())
    (url "http://snow-repository.s3-website-us-east-1.amazonaws.com/srfi-19-time.tgz")
    (size 58903)
    (checksum (md5 "8c7de9cc254674246a436ca8ac91e426"))
    (library
      (name (snow srfi-19-time))
      (path "snow/srfi-19-time.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-19/srfi-19.html")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Will Fitzgerald" "Neodesic Corporation")
      (description "srfi-19-time")
      (license BSD-style)
      (depends)))
  (package
    (name ())
    (url "http://snow-repository.s3-website-us-east-1.amazonaws.com/srfi-29-format.tgz")
    (size 10775)
    (checksum (md5 "34b40c2129b6151d9b5fabe80d17d4d5"))
    (library
      (name (snow srfi-29-format))
      (path "snow/srfi-29-format.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-29/srfi-29.html")
      (maintainers)
      (authors)
      (description "srfi-29-format")
      (license mit)
      (depends)))
  (package
    (name ())
    (url "http://snow-repository.s3-website-us-east-1.amazonaws.com/srfi-60-integers-as-bits.tgz")
    (size 9751)
    (checksum (md5 "ec7ea4f863af6c977509923e162146bd"))
    (library
      (name (snow srfi-60-integers-as-bits))
      (path "snow/srfi-60-integers-as-bits.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "bytevector compatibility layer")
      (license lgpl/v2.1)
      (depends)))
  (package
    (name ())
    (url "http://snow-repository.s3-website-us-east-1.amazonaws.com/srfi-95-sort.tgz")
    (size 12311)
    (checksum (md5 "3816c28da119d94c3ea8af2cf71b5908"))
    (library
      (name (snow srfi-95-sort))
      (path "snow/srfi-95-sort.sld")
      (version "1.0")
      (homepage
        "http://srfi.schemers.org/srfi-95/srfi-95.html"
        "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Aubrey Jaffer" "Richard A. O'Keefe" "D.H.D. Warren")
      (description "Sorting and Merging")
      (license public-domain)
      (depends (snow gauche-sort-utils)))
    (library
      (name (snow gauche-sort-utils))
      (path "snow/gauche-sort-utils.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "Sorting and Merging")
      (license public-domain)
      (depends)))
  (package
    (name ())
    (url "http://snow2.s3-website-us-east-1.amazonaws.com/srfi-27-random.tgz")
    (size 3095)
    (checksum (md5 "6536a56dd3fda8c5e4e150397eaa5b1e"))
    (library
      (name (seth srfi-27-random))
      (path "seth/srfi-27-random.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-27-random")
      (license bsd)
      (depends)))
  (package
    (name ())
    (url "http://snow2.s3-website-us-east-1.amazonaws.com/srfi-37-argument-processor.tgz")
    (size 13335)
    (checksum (md5 "57cb177d2eb7de294287a58f3dabb6e5"))
    (library
      (name (seth srfi-37-argument-processor))
      (path "seth/srfi-37-argument-processor.sld")
      (version "1.0")
      (homepage "http://srfi.schemers.org/srfi-37/srfi-37.html")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Anthony Carrico")
      (description "srfi-27-random")
      (license bsd)
      (depends)))
  (package
    (name ())
    (url "http://snow2.s3-website-us-east-1.amazonaws.com/srfi-69-hash-tables.tgz")
    (size 18455)
    (checksum (md5 "6dc54ab30d165fbbf6055213698ddbbb"))
    (library
      (name (seth srfi-69-hash-tables))
      (path "seth/srfi-69-hash-tables.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "srfi-69-hash-tables")
      (license bsd)
      (depends))))
