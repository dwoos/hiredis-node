all:
	node-gyp configure build

deps/hiredis/README.md:
	git submodule init && git submodule update

clean:
	node-gyp clean

temp:
	rm -rf tmp/hiredis
	mkdir -p tmp/hiredis
	cp -r README *.{cc,h,js*} binding.gyp wscript Makefile deps test tmp/hiredis
	cd tmp/hiredis && rm -rf deps/*/.git* deps/*/*.o deps/hiredis/libhiredis.*

package: temp
	cd tmp && tar -czvf hiredis.tgz hiredis

check:
	npm test
