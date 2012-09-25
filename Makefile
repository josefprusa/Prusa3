INCLUDES = $(wildcard src/inc/*.scad)
MODELS = $(patsubst src/%,%,$(wildcard src/*.scad))

STL_FILES_1 = $(foreach src, $(MODELS),output/$(src))
STL_FILES = $(STL_FILES_1:%.scad=%.stl)

all: $(STL_FILES)

output/%.stl: src/%.scad $(INCLUDES) configuration.scad
	mkdir -p output
	openscad -o $@ $<
