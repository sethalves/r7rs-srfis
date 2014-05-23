#
#
#

all:

package: index
	snow2 -r . package packages/*.package

upload:
	snow2 -r . s3-upload packages/*.package

clean:
	rm -f *~ */*~ */*/*~ */*/*/*~
	rm -f *.tgz
	ls tests | while read I ; do \
		(cd tests/$$I && make clean) \
	done
