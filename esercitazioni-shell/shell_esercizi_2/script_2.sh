#!/bin/bash

# Definizione delle variabili
IN="C:/TEMP/shell_esercizi_2/IN"
OUT="C:/TEMP/shell_esercizi_2/OUT"


# Itera su tutti i file CSV nella cartella IN
for file in "$IN"/*.csv; do
    # Verifica se il file esiste
    if [ -f "$file" ]; then
        # Estrazione della data dalla prima riga del file
        date=$(head -n 1 "$file" | tr -d '[:space:]' | cut -d',' -f1)
        
        # Formattazione della data nel formato gg_mm_aaaa
        formatted_date=$(echo "$date" | awk -F/ '{print $1 "_" $2 "_" $3}')
        
        # Creazione della sottocartella nella cartella OUT
        subdir="$OUT/$formatted_date"
        if [ ! -d "$subdir" ]; then
            echo "Creazione della sottocartella $subdir in corso..."
            mkdir -p "$subdir"
        fi
        
        # Rinomina il file con timestamp_nomefile e lo sposta nella sottocartella
        filename=$(basename "$file")
        timestamp=$(date +"%Y%m%d_%H%M%S")
        new_filename="${timestamp}_${filename}"
        mv "$file" "$subdir/$new_filename"
        
        echo "File $filename spostato e rinominato in $subdir/$new_filename"
    fi
done

