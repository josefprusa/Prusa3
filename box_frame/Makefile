#openscad -o output/bushing.stl bushing.scad

INCLUDES = $(wildcard inc/*.scad)

MODELS = $(filter-out configuration.scad, $(wildcard *.scad))

STL_FILES_1 = $(foreach src, $(MODELS),output/$(src))
STL_FILES = $(STL_FILES_1:%.scad=%.stl)

all: $(STL_FILES)

MODELS_EXTRAS = $(wildcard extras/*.scad)
STL_EXTRAS_1 = $(foreach src, $(MODELS_EXTRAS),output/$(src))
STL_EXTRAS = $(STL_EXTRAS_1:%.scad=%.stl)

extras: $(STL_EXTRAS)

output/%.stl: %.scad $(INCLUDES) configuration.scad
	openscad -o $@ $<

clean:
	rm output/*.stl output/*.gcode output/extras/*.stl output/extras/*.gcode
