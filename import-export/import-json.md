# Daten aus JSON Datei importieren

(Konsole leeren: `\! clear`{{execute}})

PostgreSQL bietet standardmäßig keine Option um JSON-Daten elegant zu importieren.

Dies ist nur über Umwege möglich. Genutzt wird hierzu die Funktion `json_populate_recordset()`

## Funktion `json_populate_recordset()`
Die Funktion `json_populate_recordset()` akzeptiert zwei Argumente. Das erste Argument ist der Typ, den die Datensätze der JSON-Datei repräsentieren (in diesem Fall der Typ `persons`, da die Tabelle so benannt ist.)

Das folgende Statement gibt dann die Datensätze entsprechend ihrer Keys aufgeteilt aus:

```
SELECT * FROM json_populate_recordset(null::persons,'[
    { "id": 7, "name": "Angela Fischer;", "zipcode": 91337 },
    { "id": 8, "name": "Birgit Bauer", "zipcode": 22117 },
    { "id": 9, "name": "Sigrid Baumann", "zipcode": 67739 }
]');
```{{execute}}

Diese Abfrage kann mit einem `INSERT INTO` kombiniert werden um die Daten in die Tabelle einzufügen.

```
INSERT INTO persons (id, name, zipCode)
SELECT * FROM json_populate_recordset(null::persons, '[
    { "id": 7, "name": "Angela Fischer;", "zipcode": 91337 },
    { "id": 8, "name": "Birgit Bauer", "zipcode": 22117 },
    { "id": 9, "name": "Sigrid Baumann", "zipcode": 67739 }
]');
```

Um die Daten nun über eine Datei einzulesen und nicht fest in die Abfrage zu integrieren kann eine Variable genutzt werden, die den Inhalt der Datei ausliest und speichert:

```
\set content `cat /tmp/more-persons2.json`
\echo :content
```{{execute}}

Dabei wird mit `\set content ...` der Inhalt der Datei ausgelesen und in die Variable `content` gespeichert.

Anschließend wird testweise die Variable ausgegeben.

```
SELECT * 
FROM json_populate_recordset(null::persons, :'content');
```{{execute}}


Und dann mittels der Funktion `json_populate_recordset()` als `person` gemappt. Hierbei wird der Typ angegeben und dann mit dem `:` die `content`-Variable. Durch die Verwendung von `'` wird der Inhalt der Variable in einfache Hochkommata gesetzt, sodass dieser als JSON interpretiert werden kann.

Durch die Kombination der Variable mit dem `INSERT INTO ... SELECT`-Befehl können so JSON-Daten importiert werden.

```
INSERT INTO persons (id, name, zipCode)
SELECT * 
FROM json_populate_recordset(null::persons, :'content');
```{{execute}}

Nun müssten 9 Datensätze in der `persons`-Tabelle gespeichert sein...

```
SELECT * 
FROM persons;
```{{execute}}

## Einschränkungen
Damit die oben genannten Befehle funktionieren müssen folgende Bedingungen erfüllt sein:
- JSON-Keys müssen gleich wie Spaltennamen heißen
- In der JSON-Datei dürfen nur `"` vorkommen keine `'`
- Sollte ein oder mehrere Key-Value-Paare fehlen werden diese von `json_populate_recordset()` ignoriert und mit einem leeren String aufgefüllt.


## Quellen
- https://www.postgresql.org/docs/10/functions-json.html
- https://www.postgresql.org/docs/current/app-psql.html#APP-PSQL-INTERPOLATION