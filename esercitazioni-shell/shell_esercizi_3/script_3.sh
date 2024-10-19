#!/bin/bash

# parametri del database
DB_USER="system"
DB_PASSWORD="your_password"
DB_SID="orcl"
DB_HOST="localhost"
DB_PORT="1521"

# credenziali del nuovo utente
NEW_USER="shell"
NEW_PASSWORD="script"

# percorso del file CSV
csv_path="users.csv"

# 1. Creazione del nuovo utente con shell e SQL*Plus
echo "Creazione del nuovo utente $NEW_USER..."

sqlplus $DB_USER/$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_SID as sysdba <<EOF
create user $NEW_USER IDENTIFIED BY $NEW_PASSWORD
grant dba, resource, connect to $NEW_USER;
exit;
EOF

# 2. Connessione come "Shell" e creazione tabella "users"
sqlplus $NEW_USER/$NEW_PASSWORD@$DB_HOST:$DB_PORT/$DB_SID <<EOF
create table users (
    cf varchar2(16) primary key,
    name varchar2(50),
    age number(3),
    dins date default sysdate
);
exit;

EOF

echo "Tabella 'users' creata con successo!"


# 3. inserimento dei dati dal file csv nella tabella "users"
echo "Inserimento dei dati dal file CSV ..."

# Iterazione su ogni riga del csv e inserimento dati
while IFS=, read -r cf name age do
	
	if [ "$cf" != "cf" ]; then # salta intestazione
		sqlplus $NEW_USER/$NEW_PASSWORD@$DB_HOST:$DB_PORT/$DB_SID <<EOF
		insert into users (cf, name, age)
		values ('$cf', '$name', '$age');
		commit;
		exit;
EOF
		echo "Inserito: cf=$cf, Nome=$nome, età=$age"
	fi

done < $csv_path

echo "Dati inseriti correttamente dalla tabella CSV nella tabella users"



