#openscad -o output/bushing.stl bushing.scad

# Type of 3D Model file to output. Known to work with AMF or STL.
OUTPUT_TYPE=stl
INCLUDES = $(wildcard inc/*.scad)

MODELS = $(filter-out configuration.scad, $(wildcard *.scad))

STL_FILES_1 = $(foreach src, $(MODELS),output/$(src))
STL_FILES = $(STL_FILES_1:%.scad=%.$(OUTPUT_TYPE))

all: $(STL_FILES)

MODELS_EXTRAS = $(wildcard extras/*.scad)
STL_EXTRAS_1 = $(foreach src, $(MODELS_EXTRAS),output/$(src))
STL_EXTRAS = $(STL_EXTRAS_1:%.scad=%.$(OUTPUT_TYPE))

extras: $(STL_EXTRAS)

output/%.$(OUTPUT_TYPE): %.scad $(INCLUDES) configuration.scad
	openscad -o $@ $<

clean:
	rm output/*.$(OUTPUT_TYPE) output/*.gcode output/extras/*.stl output/extras/*.gcode
