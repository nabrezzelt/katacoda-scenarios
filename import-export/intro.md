# Einführung
In diesem Szenario geht es um den Import und Export von CSV- und JSON-Dateien in eine relationale PostgreSQL-Datenbank. Verwendet werden hier die PostgreSQL eigenen Hilfsmittel wie das kommandozeilen Werkzeug `psql` oder der integrierte `COPY`-Befehl.

Nach dem Durchführen des Szenarios solltest du wissen was das CSV/JSON-Format ist und wie du Daten in das jeweilige Format importieren oder exportieren kannst. Außerdem sind einige weiterführende Konfigurationsoptionen beschrieben, welche für die weitere Nutzung hilfreich sein können. 


# Verwendung
Beide Formate können für den Import und Export von Daten verwendet werden. Dabei bieten sich CSV-Dateien bei Tabellen oder Listen an. Das JSON-Format kann hier ebenfalls genutzt werden, bietet aber zudem die Möglichkeit der Darstellung von verschachtelten Datenstrukturen.

Mögliche Nutzungsszenarien sind z. B. der Import von oder Export zu anderen Applikationen, sowie z. B. Backupmöglichkeiten.

Außerdem wird JSON oftmals in NoSQL-Datenbanken eingesetzt, da hier das Schema der Daten zu beginn oft nicht feststeht.
So ist das Schema sehr flexibel und erst wird erst beim Lesen (schema-on-read) und nicht beim Schreiben (schema-on-write) festgelegt.

<img src="assets/json-for-schemaless-db-design.png" alt="JSON - schemaless future for Database design" style="max-width: 450px; width: 100%; display: block">
<i style="font-size: 80%">Abbildung 1: JSON - schemaless future for Database design?.</i>