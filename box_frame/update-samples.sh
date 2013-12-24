#!/bin/bash
#this script generates models for all samples

find sample_stls -name "*.stl" -delete
find sample_stls -name "*.gcode" -delete

if [ -e configuration.scad.dist ]; then
    if [ -e configuration.scad ]; then
        mv --backup=numbered configuration.scad configuration.scad.autobackup
    fi


    for i in `ls sample_stls`
    do
        DIR=sample_stls/$i
        echo $DIR
        if [ -e $DIR/configuration.scad ]; then
            rm configuration.scad
            cp $DIR/configuration.scad configuration.scad
            make clean
            # build standard models
            make

            # I do not want all extras in samples,
            # so lets build only some of them
            EXTRAS="tube_clamp.stl calibrate.stl"

            # for box model there is additional part in extras (replaces bushing.stl)
            # (brackets that hold Y bearings to Y carriage)
            # and we dont want y-axis-bracket from standard models
            if grep "i_am_box = 0;" configuration.scad ; then
                rm output/y-axis-bracket.stl
                rm output/bushing.stl
                EXTRAS="$EXTRAS bearing-holder-single-plate-y.stl"
            fi
            # build wade extruder for medium carriage
            if grep "carriage_l_base = 50" configuration.scad ; then
                EXTRAS="$EXTRAS gregs-wade-v3.stl wade-gears.stl"
            fi
            # build the extras
            for model in $EXTRAS
            do
                make output/extras/$model
            done

            cp -f output/*stl $DIR
            cp -f output/extras/*stl $DIR/extras
        fi

    done

    if [ -e configuration.scad.autobackup ]; then
        mv configuration.scad.autobackup configuration.scad
    fi

else
    echo "configuration.scad.dist not found, aborting"
fi
