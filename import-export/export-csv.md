# Disclaimer
Manchmal können innerhalb des Katacoda-Szenarios die Datenbank und die Testtabelle nicht angelegt werden.

Die Tabelle und Datebank sollte korrekte angelegt sein wenn folgende Ausgabe aus der Konsole erscheint: 
> CREATE TABLE
> INSERT 0 3
> ...
> You are now connected to database "sample" as user "postgres".

Sollte dies nicht der Fall sein, bitte einfach das Szenario mit `F5` neuladen :)

# Daten in eine CSV-Datei exportieren
Um Datensätze aus einer Datenbank in eine CSV-Datei zu exportieren kann der `COPY` Befehl verwendet werden.

Im nachfolgenden wird der Aufbau des Befehls erläutert und die grundlegenden/wichtigsten Optionen erläutert.

Beispielhaft wird dies an der Tabelle `persons` gezeigt, welche folgenden Aufbau hat:

| Spalte  | Datentyp |
| ------- | -------- |
| Id      | SERIAL   |
| Name    | varchar  |
| ZipCode | int      |

Grundlegend ist der Aufbau des Befehls folgendermaßen:

```
COPY { table_name | query }
    TO { file_name | STDOUT }
    WITH options
```

### `{table_name | query }`
Dabei kann im ersten Teil der Abfrage entweder einen Tabellennamen angegeben werden oder eine SQL-Abfrage.

Wird nur ein Tabellennamen angegeben, werden alle Spalten in die CSV-Datei geschrieben.

Zusätzlich kann in Klammern angegeben werden ob z. B. nur einzelne Spalten exportiert werden sollen.

Die folgende Abfrage exportiert nun alle Spalten der Tabelle `persons` und gibt diese auf der Standardausgabe aus. Getrennt werden die Spalten dabei mittels eines `;`.

```
COPY persons
TO STDOUT (DELIMITER ';');
```{{execute}}


Wenn nur die `Name`-Spalte ausgegeben werden soll:

```
COPY persons(Name)
TO STDOUT (DELIMITER ';');
```{{execute}}


Zudem ist es möglich auch eine SQL-Abfrage anzugeben, wenn z. B. alle Personen mit einer bestimmten PLZ exportiert werden sollen:

```
COPY (SELECT * FROM persons WHERE ZipCode = 10117)
TO STDOUT (DELIMITER ';');
```{{execute}}

### `TO { file_name | STDOUT }`
Im `TO`-Abschnitt der Abfrage kann ausgewählt werden wohin die Daten exportiert werden sollen. Dabei ist STDOUT die Standardausgabe auf der Konsole. Um Daten in eine Datei zu exportieren muss alternativ der Dateiname angegeben werden.

### `options`
Im letzten Abschnitt der Abfrage können verschiedene Optionen angegeben werden. Eine der Wichtigsten ist dabei z. B. ob ein Header mit ausgegeben werden soll.

#### `DELIMITER`
Die `DELIMITER`-Option gibt an, wie die einzelnen Spalten voneinander abgetrennt sind.

#### `CSV HEADER`
Ausgegeben wird dieser durch die Option: `CSV HEADER`

Bsp.:
```
COPY persons
TO STDOUT DELIMITER ';' CSV HEADER;
```{{execute}}

#### `QUOTE` und `ESCAPE`
Mittels den Optionen `QUOTE` und `ESCAPE` können Anpassungen der Textbegrenzungszeichen und Escape-Zeichen gemacht werden.

Weitere Informationen zu den sonst unterstützten Optionen des Befehls sind auf der Dokumentationsseite von PostgreSQL zu finden.

### Quellen
- The PostgreSQL Global Development Group, “COPY,” PostgreSQL Documentation. https://www.postgresql.org/docs/14/sql-copy.html (accessed Nov. 16, 2021).

- PostgreSQL Tutorial Website, “Export PostgreSQL Table to CSV File,” www.postgresqltutorial.com. https://www.postgresqltutorial.com/export-postgresql-table-to-csv-file/ (accessed Nov. 16, 2021).

