#!/bin/bash
#this script generates models for all samples

if [ -e configuration.scad.dist ]; then

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
            # build the extras
            for model in $EXTRAS
            do
                make output/extras/$model
            done

            cp -f output/*stl $DIR
            cp -f output/extras/*stl $DIR/extras
        fi

    done

else
    echo "configuration.scad.dist not found, aborting"
fi
