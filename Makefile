#
#
#

all:

package:
	snow2 -r . package packages/*.package

upload: package
	snow2 upload

test:
	ls tests | while read I; do make -C tests/$$I $@; done

test-chibi:
	ls tests | while read I; do make -C tests/$$I $@; done

test-chicken:
	ls tests | while read I; do make -C tests/$$I $@; done

test-foment:
	ls tests | while read I; do make -C tests/$$I $@; done

test-gauche:
	ls tests | while read I; do make -C tests/$$I $@; done

test-sagittarius:
	ls tests | while read I; do make -C tests/$$I $@; done

clean:
	rm -f *~ */*~ */*/*~ */*/*/*~
	rm -f *.tgz
	find . -name Makefile | grep -v '^./Makefile$$' | while read I; do (cd `dirname $$I` && make clean); done
	rm -f tmp1
