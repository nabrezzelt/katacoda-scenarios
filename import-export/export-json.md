# Daten in eine JSON-Datei exportieren
Leider bietet PostgreSQL keine einfache Möglichkeit Daten ins JSON-Format zu exportieren.

Aus diesem Grund müssen die zwei Funktionen `row_to_json()` und `json_agg()` in Verbindung mit dem `COPY`-Befehl verwendet werden.

## Funktion `row_to_json()`
Diese Funktion wandelt eine Zeile in einen JSON-Datensatz um.

## Funktion `json_agg()`
Diese Funktion aggregiert mehrere JSON-Datensätze in einen JSON-Array.

## Export
Der Export läuft dabei grundlegend so ab, dass als erstes die Zeilen mittels `row_to_json()` in einen JSON-Datensatz konvertiert werden 

```sql
SELECT row_to_json(persons)
FROM persons;
```{{execute}}

und dann muttels und `json_agg()` zu einem JSON-Array zusammengefasst werden.

```sql
SELECT json_agg(row_to_json(persons))
FROM persons;
```{{execute}}

Danach kann dann wie in Schritt 1 bereits beschrieben diese Abfrage für den COPY-Befehl verwendet werden.

```sql
COPY (
    SELECT json_agg(row_to_json(persons))
    FROM persons
) TO '/tmp/person-data.json';
```{{execute}}

Somit ist sind alle Datensätze in die Datei `/tmp/person-data.json` exportiert worden:
```
\! cat /tmp/person-data.json
```{{execute}}

### Quellen
- https://alphahydrae.com/2021/02/how-to-export-postgresql-data-to-a-json-file/
- https://www.postgresql.org/docs/14/sql-copy.html