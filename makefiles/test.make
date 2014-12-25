#
#
#

snow2=/usr/local/bin/snow2

# PACKAGEDIR=$(shell dirname $$PWD)
# PACKAGENAME=$(shell basename $(PACKAGEDIR))
# REPODIR=$(shell dirname $(PACKAGEDIR))
# REPONAME=$(shell basename $(REPODIR))

REPOS=-r ../..

all:

link-deps:
	snow2 -t -s $(REPOS) install $(TEST_DEPS)

install-deps:
	snow2 -t $(REPOS) install $(TEST_DEPS)

download-deps:
	snow2 install $(TEST_DEPS)

test: link-deps
	./test-chibi.scm
	@ echo
	./test-chicken.scm
	@ echo
	./test-foment.scm
	@ echo
	./test-gauche.scm
	@ echo
	./test-sagittarius.scm
	@ echo

test-chibi:
	./test-chibi.scm
	@ echo

test-chicken:
	./test-chicken.scm
	@ echo

test-foment:
	./test-foment.scm
	@ echo

test-gauche:
	./test-gauche.scm
	@ echo

test-sagittarius:
	./test-sagittarius.scm
	@ echo


clean:
	rm -f *~
#	for DEP in $(DEPS) ; do \
#		$(snow2) uninstall $(TEST_DEPS); \
#	done
	rm -rf srfi srfi-tests srfi-ancillary
	make clean-extra
