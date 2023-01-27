#!/bin/bash

ctags -R

CSCOPE_DIR="$PWD/cscope"

if [ ! -d "$CSCOPE_DIR" ]; then
mkdir "$CSCOPE_DIR"
fi

echo "Finding files ..."
find "$PWD" \( \( -iname "*.c" -o -iname "*.cc" -o -iname "*.h" \) -and \( -not -type l \) \) -print > "$CSCOPE_DIR/cscope.files" && \
find "$ZEPHYR_BASE" \( \( -iname "*.c" -o -iname "*.cc" -o -iname "*.h" \) -and \( -not -type l \) \) -print >> "$CSCOPE_DIR/cscope.files"

echo "Adding files to cscope db: $PWD/cscope.db ..."
cscope -b -i "$CSCOPE_DIR/cscope.files"

export CSCOPE_DB="$PWD/cscope.out"
echo "Exported CSCOPE_DB to: '$CSCOPE_DB'"
