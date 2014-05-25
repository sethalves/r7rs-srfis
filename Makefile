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

clean:
	rm -f *~ */*~ */*/*~ */*/*/*~
	rm -f *.tgz
	ls tests | while read I; do make -C tests/$$I $@; done
