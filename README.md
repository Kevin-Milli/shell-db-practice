
# Shell Scripting & Database Automation
Benvenuti nella repository Shell Scripting & Database Automation! 
Questa repo contiene una raccolta di script Bash utili per la gestione di file, compressione, organizzazione e interazione con database Oracle. 
Qui troverai esercitazioni pratiche che ti aiuteranno a migliorare le tue abilità in shell scripting e nella connessione a database.

#### Contenuti
- **shell_esercizi_1:** Compressione di File
- **shell_esercizi_2:** Gestione di File CSV
- **shell_esercizi_3:** Automazione Database con Oracle SQL

## Esercizio 1: Compressione di File
### Descrizione
Questo script automatizza il processo di compressione di file in una cartella specifica e li sposta in una directory di output. La directory di input viene eliminata dopo la compressione.

### Come funziona:
- Verifica se le cartelle di input (`IN`) e output (`OUT`) esistono.
- Se non esistono, lo script le crea.
- Comprimi i file dalla cartella `IN` in un archivio ZIP nella cartella `OUT`.
- Elimina la cartella IN dopo la compressione.
- Mostra un messaggio di successo alla fine del processo.

## Esercizio 2: Gestione di File CSV
### Descrizione
Questo script organizza i file CSV in base alla data estratta dalla prima riga di ciascun file. Rinomina ogni file e lo sposta in una sottocartella della directory di output (OUT), con il nome della sottocartella basato sulla data trovata.

### Come funziona:
- Scansiona la directory di input (`IN`) per trovare tutti i file CSV.
- Estrae la data dalla prima riga del CSV (presumibilmente in formato `gg/mm/aaaa`).
- Crea una sottocartella nella directory di output (`OUT`) con il nome della data formattata.
- Rinomina il file CSV con un timestamp corrente e lo sposta nella sottocartella corrispondente.

## Esercizio 3: Automazione Database con Oracle SQL

### Descrizione
Questo script interagisce con un database Oracle per:
1. Creare un nuovo utente.
2. Creare una tabella per l'archiviazione di dati utente.
3. Popolare la tabella leggendo i dati da un file CSV.

### Come funziona:
- **Creazione utente:** Utilizzando sqlplus, lo script crea un nuovo utente nel database Oracle con privilegi DBA.
- **Creazione tabella:** Una volta creato l'utente, lo script crea una tabella chiamata users con campi come codice fiscale (CF), nome, età e data di inserimento.
- **Popolamento tabella:** Legge i dati dal file users.csv e li inserisce nella tabella users, saltando l'intestazione del CSV.

### Requisiti:
- **Oracle SQLPlus:** Deve essere installato e configurato.
