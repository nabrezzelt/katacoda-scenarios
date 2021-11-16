# Daten in eine JSON-Datei exportieren

(Konsole leeren: `\! clear`{{execute}})

Leider bietet PostgreSQL keine eingebaute Möglichkeit Daten ins JSON-Format zu exportieren.

Aus diesem Grund müssen die zwei Funktionen `row_to_json()` und `json_agg()` in Verbindung mit dem `COPY`-Befehl verwendet werden.

## Funktion `row_to_json()`
Diese Funktion wandelt eine Zeile in einen JSON-Datensatz um.

## Funktion `json_agg()`
Diese Funktion aggregiert mehrere JSON-Datensätze in einen JSON-Array.

## Export
Der Export läuft dabei grundlegend so ab, dass als erstes die Zeilen mittels `row_to_json()` in einen JSON-Datensatz konvertiert werden 

```
SELECT row_to_json(persons)
FROM persons;
```{{execute}}

und dann mittels und `json_agg()` zu einem JSON-Array zusammengefasst werden.

```
SELECT json_agg(row_to_json(persons))
FROM persons;
```{{execute}}

Danach kann dann wie in Schritt 1 bereits beschrieben diese Abfrage für den COPY-Befehl verwendet werden.

```
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
- S. Oulevay, “How to export PostgreSQL data to a JSON file,” AlphaHydrae, Feb. 10, 2021. https://alphahydrae.com/2021/02/how-to-export-postgresql-data-to-a-json-file/ (accessed Nov. 16, 2021).
- The PostgreSQL Global Development Group, “COPY,” PostgreSQL Documentation. https://www.postgresql.org/docs/14/sql-copy.html (accessed Nov. 16, 2021).