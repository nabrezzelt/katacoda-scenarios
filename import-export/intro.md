# Einführung
In diesem Szenario geht es um den Import und Export von CSV- und JSON-Dateien in eine relationale PostgreSQL-Datenbank.

## Verwendung
Beide Formate können für den Import und Export von Daten verwendet werden. Dabei bieten sich CSV-Dateien bei Tabellen oder Listen an. Das JSON-Format kann hier ebenfalls genutzt werden, bietet aber zudem die Möglichkeit der Darstellung von verschachtelten Datenstrukturen.

Mögliche Nutzungsszenarien sind z. B. der Import von oder export zu anderen Applikationen, sowie z. B. Backupmöglichkeiten.

## CSV-Dateien
CSV-Dateien (Comma-separated values) sind im Grund strukturierte Textdateien meist mit der Dateiendung ".csv".

Innerhalb einer Datei werden Datensätze und Datenfelder (Spalten) unterschieden. Dabei enthält jede Zeile einen Datensatz, welcher mit einem Zeilenumbruch abgeschlossen wird. Die einzelnen Werte eines Datensatzes werden dabei mit einem Trennzeichen voneinander abgegrenzt. Dieser kann ein beliebiges Zeichen sein - üblich sind Komma, Semikolon oder auch ein Tabulator-Zeichen. 

Um Sonderzeichen innerhalb der Datenfelder zu ermöglichen, wird teilweise noch ein Textbegrenzungszeichen verwendet. Meist ein Anführungszeichen ".

Zudem ist es möglich (optional), innerhalb der Datei eine Kopfzeile zu definieren, welche Aufschluss über den Inhalt der einzelnen Spalten gibt.

Grundlegend wird ein Standard für das Format von CSV-Dateien in [RFC4180](https://datatracker.ietf.org/doc/html/rfc4180) beschrieben.

Ein Datensatz von 2 Kunden sieht im CSV-Format folgendermaßen aus:

```CSV
1;Hans;Maier
2;Peter;Müller
```

## JSON-Dateien
JSON (JavaScript Object Notation) ist ein Dateiformat, welches für die einfachen Datenübertragung (Serialisierung) zwischen Anwendungen verwendet wird.

Daten werden dabei einem Objekt zugeordnet, dessen Eigenschaften aus einem Schlüssel-Wert-Paar bestehen.

Ein Datensatz aus 2 Kunden würde dabei folgendermaßen aussehen:

```JSON
[
    {
        "Kd-Nr": 1,
        "Vorname": "Hans",
        "Nachname": "Maier"
    },
    {
        "Kd-Nr": 2,
        "Vorname": "Peter",
        "Nachname": "Müller"
    }
]
```

Kunden:
| Kundennr | Vorname | Nachname |
| -------- | ------- | -------- |
| 1        | Hans    | Maier    |
| 2        | Peter   | Müller   |

Daten können im JSON-Format - im Vergleich zu CSV-Dateien - beliebig oft geschachtelt werden.


