#!/bin/bash

TARGET=/app/incoming/
PROCESSED=/app/processed/

inotifywait -m -e create -e moved_to --format "%f" $TARGET \
        | while read FILENAME
                do
                        echo Detected $FILENAME, moving and zipping >> ./logfile
                        mv "$TARGET/$FILENAME" "$PROCESSED/$FILENAME"
                        gzip "$PROCESSED/$FILENAME"
                        echo processed and archived $PROCESSED/$FILENAME.gz >> ./logfile
                done
