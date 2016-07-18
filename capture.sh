#!/bin/sh
# This is captures.sh

TIMESTAMP=$( date +"%Y.%m.%d-%Hh%Mm%Ss" )
DESTINATION="/home/$USER/$USER/captures/"
PREFIX="capture"

# Create the DESTINATION directory
if [ ! -d $DESTINATION ] ; then mkdir -p $DESTINATION ; fi

# Make the actual screenshot
import $DESTINATION/$PREFIX--$TIMESTAMP.png

# Touch (and create in case those do not exist)
touch $DESTINATION/last.png
touch $DESTINATION/prev.png
touch $DESTINATION/old.png

# Rotate prev becomes old, last becomes prev,
# and last is the new one
cp $DESTINATION/prev.png $DESTINATION/old.png
cp $DESTINATION/last.png $DESTINATION/prev.png
cp $DESTINATION/$PREFIX--$TIMESTAMP.png $DESTINATION/last.png

# We want png and jpeg
convert $DESTINATION/prev.png $DESTINATION/prev.jpeg
convert $DESTINATION/last.png $DESTINATION/last.jpeg
convert $DESTINATION/old.png $DESTINATION/old.jpeg

# We want copies in the user's home directory
cp $DESTINATION/prev.jpeg ~/prev.jpeg
cp $DESTINATION/last.jpeg ~/last.jpeg
cp $DESTINATION/old.jpeg ~/old.jpeg
cp $DESTINATION/prev.png ~/prev.png
cp $DESTINATION/last.png ~/last.png
cp $DESTINATION/old.png ~/old.png

# If we need to display the screenshot
# display $DESTINATION/$PREFIX--$TIMESTAMP.png
