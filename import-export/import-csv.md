# Daten aus einer CSV-Datei importieren
Um Datensätze aus einer CSV-Datei in eine Datenbank zu importieren kann ebenfalls der `COPY`-Befehl verwendet werden.

Im nachfolgenden werden weitere Daten aus der Datei `more-persons.csv` importiert.

Der Aufbau des Befehls ist analog zum Import, nur dass anstatt des `TO` ein `FROM` verwendet wird.

```sql
COPY { table_name }
    FROM { file_name | STDIN }
    WITH options
```

### `{table_name }`
Der `{table_name }` gibt an in wleche Tabelle die Daten importiert werden sollen.

### `FROM { file_name | STDIN }`
Im `FROM`-Abschnitt der Abfrage muss dann der Dateiname angegeben werden, in den die Daten exportiert werden sollen. Alternativ können die daten auf von der Standardeingabe STDIN gelesen werden.

### `options`
Im letzten Abschnitt der Abfrage können erneut verschiedene Optionen angegeben werden.

#### `CSV HEADER`
Enthält die Datei einen Header, muss dies in dem Import-Befehlt angegeben werden, sodass die erste Spalte ignoriert wird. 


#### `QUOTE` und `ESCAPE`
Mittels den Optionen `QUOTE` und `ESCAPE` können Anpassungen der Textbegrenzungszeichen und Escape-Zeichen gemacht werden.

Weitere Informationen zu den sonst unterstützten Optionen des Befehls sind auf der Dokumentationsseite  von PostgreSQL zu finden.

### Beispiel Import der Datei `more-persons.csv`:
Führe den den folgenden Befehl aus um den Inhalt der Datei `more-persons.csv` einzusehen:

```
\! cat person-data.sql
```{{execute}}

Da hier ersichtlich ist, dass die Datei einen Header enthält und durch `;` getrennt ist, muss dies in dem Import-Befehl angegeben werden.

Dieser sieht dann folgendermaßen aus:

```
\copy persons FROM '\data\more-persons.csv' DELIMITER ';' CSV HEADER
```{{execute}}

```sql
COPY persons 
FROM PROGRAM 'cat \data\more-persons.csv' 
DELIMITER ';' 
CSV HEADER;
```{{execute}}


### Quellen
https://www.postgresql.org/docs/9.2/sql-copy.html
