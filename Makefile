arty: build/artyz7_20_ps.tcl

build/%.tcl: board/%.yml
	-@mkdir build
	python3 fuse-zynq/sw/generate.py $< $@

clean:
	-rm -rf build