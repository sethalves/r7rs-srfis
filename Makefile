#
#
#

all:

package:
	snow2 -r . package packages/*.package
	ls *.tgz | while read I; do   gunzip "$$I";   gzip -n -9 $${I%%.*}.tar;   mv $${I%%.*}.tar.gz $${I%%.*}.tgz; done

upload: package
	snow2 upload


link-deps:
	find . -name Makefile | grep -v '^./Makefile$$' | while read I; do (cd `dirname $$I` && make link-deps); done

test-chibi:
	csnow2 run-source-tests

test-chicken:
	echo

test-foment:
	fsnow2 run-source-tests

test-gauche:
	gsnow2 run-source-tests

test-sagittarius:
	ssnow2 run-source-tests


clean:
	rm -f *~ */*~ */*/*~ */*/*/*~
	rm -f *.tgz
	find . -name Makefile | grep -v '^./Makefile$$' | while read I; do (cd `dirname $$I` && make clean); done
	rm -f tmp1
