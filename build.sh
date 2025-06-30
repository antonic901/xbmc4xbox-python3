#!/bin/sh
DEST="BUILD/python"
OUT="$DEST/python34.zlib"

mkdir -p $DEST
mkdir -p $DEST/DLLs

cp -v "python/XBOXbuild/Release/python34.dll" "$DEST/"
cp -v "python/XBOXbuild/Release/"*.pyd "$DEST/DLLs"
rm -f "$OUT"

cd python/Lib/
zip "../../$OUT" \
  -r . \
  -i \*.py \
  -x \
    plat-\* \
    distutils/\* \
    curses/\* \
    lib-tk/\* \
    lib2to3/\* \
    idlelib/\* \
    test/\* \
    unittest/\* \
    multiprocessing/\* \
    \*/tests/\* \
    \*/test/\*
