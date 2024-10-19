#!/bin/bash

IN="C:/TEMP/Shell_esercizio_1/domanda_3/IN"
OUT="C:/TEMP/Shell_esercizio_1/domanda_3/OUT"


if [ ! -d "$IN" ]; then
	echo "Cartella $IN non esistente. Creazione in corso..."
	mkdir -p "$IN"
fi

if [ ! -d "$OUT" ]; then
	echo "Cartella $OUT non esistente. Creazione in corso..."
	mkdir -p "$OUT"
fi


TIMESTAMP=$(date +"%Y_%m_%d_%H")
ZIPFILE="${TIMESTAMP}.zip"


zip -j "$OUT/$ZIPFILE" "$IN"/*


rm -r "$IN"

echo "Operazione Completata"

