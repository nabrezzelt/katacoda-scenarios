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

```sql
COPY { table_name | query }
    TO { file_name | STDOUT }
    WITH options
```

### `{table_name | query }`
Dabei kann im ersten Teil der Abfrage entweder eine Tabellennamen angegeben werden oder eine SQL-Abfrage.

Wird nur ein Tabellennamen angegeben, werden alle Spalten in die CSV-Datei geschrieben.

Zusätzlich kann in Klammern angegeben werden ob z. B. nur einzelne Spalten exportiert werden sollen.

Die folgende Abfrage exportiert nun alle Spalten der Tabelle `persons` und gibt diese auf der Standardausgabe aus.
```sql
COPY persons
TO STDOUT;
``` {{execute}}

Wenn nur die Spalten `Id` und `Name` ausgegeben werden sollen:

```sql
COPY persons(Id, Name)
TO STDOUT;
``` {{execute}}

Zudem ist es möglich auch eine SQL-Abfrage anzugeben, wenn z. B. alle Personen mit einer bestimmten PLZ exportiert werden sollen:

```sql
COPY (SELECT * FROM persons WHERE ZipCode = 12345)
TO STDOUT;
``` {{execute}}

### `TO { file_name | STDOUT }`