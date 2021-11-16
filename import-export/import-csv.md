# Daten aus einer CSV-Datei importieren

(Konsole leeren: `\! clear`{{execute}})

Um Datensätze aus einer CSV-Datei in eine Datenbank zu importieren kann ebenfalls der `COPY`-Befehl verwendet werden.

Im nachfolgenden werden weitere Daten aus der Datei `more-persons.csv` importiert.

Der Aufbau des Befehls ist analog zum Import, abgesehen davon, dass anstatt des `TO` ein `FROM` verwendet wird.

```
COPY { table_name }
    FROM { file_name | STDIN }
    WITH options
```

### `{table_name }`
Der `{table_name }` gibt an in welche Tabelle die Daten importiert werden sollen.

### `FROM { file_name | STDIN }`
Im `FROM`-Abschnitt der Abfrage muss dann der Dateiname angegeben werden, in den die Daten exportiert werden sollen. Alternativ können die Daten auf von der Standardeingabe STDIN gelesen werden.

### `options`
Im letzten Abschnitt der Abfrage können erneut verschiedene Optionen angegeben werden.

#### `CSV HEADER`
Enthält die Datei einen Header, muss dies in dem Import-Befehlt angegeben werden, sodass die erste Spalte ignoriert wird. 


#### `QUOTE` und `ESCAPE`
Mittels den Optionen `QUOTE` und `ESCAPE` können Anpassungen der Textbegrenzungszeichen und Escape-Zeichen gemacht werden.

Weitere Informationen zu den sonst unterstützten Optionen des Befehls sind auf der Dokumentationsseite von PostgreSQL zu finden.

### Beispiel Import der Datei `more-persons.csv`:
Führe den folgenden Befehl aus um den Inhalt der Datei `more-persons.csv` einzusehen:

```
\! cat /data/more-persons.csv
```{{execute}}

Da hier ersichtlich ist, dass die Datei einen Header enthält und durch `;` getrennt ist, muss dies in dem Import-Befehl angegeben werden.

Dieser sieht dann folgendermaßen aus:


```
COPY persons 
FROM '/tmp/more-persons.csv' 
DELIMITER ';' 
CSV HEADER;
```{{execute}}

Wichtig bei der Ausführung des Befehls ist, dass der Datenbankbenutzer Zugriff auf die zu importierende Datei haben muss. Aus diesem Grund, wurden die Daten bereits in das `/tmp`-Verzeichnis kopiert, auf das der Datenbank-Nutzer Zugriff hat.

Alternativ kann hierzu auf der `\copy` Befehl des psql-Clients verwendet werden:

```
\copy persons FROM '/data/more-persons.csv' DELIMITER ';' CSV HEADER
```

Dieser führt zum gleichen Ergebnis wie der `COPY`-Befehl, abgesehen davon, dass der Inhalt der Datei auf clientseite interpretiert wird und so vom Server kein Zugriff auf die Datei notwendig ist.

Vom Aufbau unterscheidet dieser sich nur darin, dass `COPY` zu Beginn weggelassen wird und der Befehl in einer Zeile stehen muss.

Nach dem erfolgreichen Import, sollten nun die importierten Daten in der Tabelle stehen:

```
SELECT * 
FROM persons;
```{{execute}}


### Quellen
- The PostgreSQL Global Development Group, “COPY,” PostgreSQL Documentation. https://www.postgresql.org/docs/14/sql-copy.html (accessed Nov. 16, 2021).
- PostgreSQL Tutorial Website, “Import CSV File Into PosgreSQL Table,” PostgreSQL Tutorial Website. https://www.postgresqltutorial.com/import-csv-file-into-posgresql-table/.
