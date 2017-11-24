#!/bin/bash

# Extract the list of all languages from the *.am file:
ALL_LANGS=$(egrep '^ALL_LANGS=' < Makefile.am | sed -e 's/ALL_LANGS=//')

TEMPLATEDIR=$(basename $(pwd))

echo "Initial automake setup of ${TEMPLATEDIR}"

for ll in $ALL_LANGS ; do
    if ! test -d $ll ; then
        echo "missing language $ll; installing from template"
        $GTCORE/scripts/new-language.sh $ll ${TEMPLATEDIR}
    fi
done

autoreconf -i -v
