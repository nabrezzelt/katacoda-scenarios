# CSV-Dateien
CSV-Dateien (Comma-separated values) sind im Grund strukturierte Textdateien meist mit der Dateiendung ".csv".

Innerhalb einer Datei werden Datensätze und Datenfelder (Spalten) unterschieden. Dabei enthält jede Zeile einen Datensatz, welcher mit einem Zeilenumbruch abgeschlossen wird. Die einzelnen Werte eines Datensatzes werden dabei mit einem Trennzeichen voneinander abgegrenzt. Dieser kann ein beliebiges Zeichen sein - üblich sind Komma, Semikolon oder auch ein Tabulator-Zeichen. 

Um Sonderzeichen innerhalb der Datenfelder zu ermöglichen, wird teilweise noch ein Textbegrenzungszeichen verwendet. Meist ein Anführungszeichen ".

Zudem ist es möglich (optional), innerhalb der Datei eine Kopfzeile zu definieren, welche Aufschluss über den Inhalt der einzelnen Spalten gibt.

Grundlegend wird ein Standard für das Format von CSV-Dateien in [RFC4180](https://datatracker.ietf.org/doc/html/rfc4180) beschrieben.

Ein Datensatz von 2 Kunden sieht im CSV-Format (mit Kopfzeile) folgendermaßen aus:

```
Kd-Nr:Vorname;Nachname              <-- Kopfzeile
1;Hans;Maier                        <-- Datensatz 1
2;Peter;Müller                      <-- Datensatz 2
```

# JSON-Dateien
JSON (JavaScript Object Notation) ist ein Dateiformat, welches für die einfache Datenübertragung (Serialisierung) zwischen Anwendungen verwendet wird. Ein Standard wird hier in [RCF8259](https://tools.ietf.org/pdf/rfc8259.pdf) beschrieben.

Daten werden dabei einem Objekt zugeordnet, dessen Eigenschaften aus einem Schlüssel-Wert-Paar bestehen.

Ein Datensatz aus 2 Kunden würde dabei folgendermaßen aussehen:

```
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

In den nachfolgenden Schritten 2-5 werden Import und Export Beispiele für CSV und JSON-Dateien vorgestellt.

# Quellen
- Y. Shafranovich, “Common Format and MIME Type for Comma-Separated Values (CSV) Files,” IETF, Oct. 01, 2005. https://datatracker.ietf.org/doc/html/rfc4180 (accessed Nov. 16, 2021).
- T. Bray, “The JavaScript Object Notation (JSON) Data Interchange Format,” IETF, Dec. 2017. https://datatracker.ietf.org/doc/html/rfc8259 (accessed Nov. 16, 2021).