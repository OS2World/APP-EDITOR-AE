.* šbersetzung dh0dz@gmx.de.
:userdoc.
:docprof toc=123456.
:title.AE Editor Hilfe
.* Subject: 
.* Version: V0.5.0
.* Copyright: 
.* Author: 
:h1 res=1 id='Introduction'.
Einfhrung
:p.AE ist ein einfacher Texteditor zur Bearbeitung von Textdateien wie die
CONFIG&per.SYS oder zum Betrachten von Readme-Dateien und „hnlichen&per. Er ist nicht gedacht
als Textverarbeitung oder Programmeditor&per.
:p.Dieser Editor l„dt Dateien beliebiger Gr”áe&per. Beim Laden von Dateien welche gr”áer als 1 MB sind k”nnen Verz”gerungen auftreten&per. Das Kopieren oder Einfgen von Text gr”áer als 64kB  &lpar.etwa
65&per.000 Buchstaben&rpar. ist nicht m”glich&per.
:p.:hp2.Geschichte:ehp2.&colon. AE ersetzt den originalen von IBM mit 
OS&slash.2 ausgelieferten "System Editor" e&per.exe&per. Er bietet die gleichen M”glichkeiten wie der Original-Editor
mit Ausnahme einiger nicht mehr ben”tigter Funktionen wie den
Dateityp&endash.Dialog beim Sichern&per. In der Entwicklung wurde AE noch mit weiteren Funktionen wie Drucken und 
Einstellm”glichkeiten fr die Zeichenkodierung ausgestattet&per.
:h1 res=2 id='FindDialog'.
Suchen
:p.Die Funktion Suchen &lpar.Strg F&rpar. erm”glicht es einen bestimmten Text aufzufinden
&per. Wenn sie die  :hp2.Suchen:ehp2. Funktion benutzen&comma. wird die n„chste 
šbereinstimmung im Text hervorgehoben&per. 
:p.Falls die entsprechende Zeilenfolge nicht gefunden wird&comma. bekommen sie eine Fehlermeldung&per.
:p.Nach Schlieáen des Suchen&endash.Dialoges k”nnen sie mit Weitersuchen
&lpar.Strg G&rpar. dieselbe Suche wiederholen&per.
:p.
:p.:hp2.Suche&colon.:ehp2. Eingabefeld fr den zu suchenden Text&per.
:p.:hp2.Groá-/Kleinschreibung beachten&colon.:ehp2. Ist dieser Knopf aktiviert&comma. sucht AE
Text mit exakter šbereinstimmung&per. Ansonsten wird die Suche nach "box" auch die Ergebnisse "BOX"
oder "Box" anzeigen&per.
:p.:hp2.Von vorn beginnen&colon.:ehp2. Aktivierung dieses Knopfes startet die Suche vom Anfang
der Datei&per. Sonst startet die Suche an der aktuellen Cursorposition&per.
:p.Diese Einstellungen werden fr die n„chste Suche gespeichert&per.
:h1 res=3 id='Replace Dialog'.
Ersetzen
:p.Die Funktion Ersetzen &lpar.Strg R&rpar. ersetzt eine zu suchende Zeichenfolge durch eine andere&per. 
:p.Nach Drcken des :hp2.Suche:ehp2.&endash.Buttons wird die n„chste šbereinstimmung gesucht und 
hervorgehoben&per. Drcken sie den :hp2.Ersetze:ehp2.&endash.Button zum Tauschen der Zeichenfolge&per.
Danach wird die n„chste šbereinstimmung gesucht&per. Durch erneutes Drcken von :hp2.Suche:ehp2. 
wird zur n„chsten šbereinstimmung gesprungen&per.
:p.M”chten sie alle šbereinstimmungen im Text ersetzen &comma. drcken sie den Button
:hp2.Ersetze alle:ehp2.&per.
:p.:hp2.Anmerkung&colon. :ehp2. Nur die :hp1.letzte:ehp1. Ersetzung kann mit der 
:hp2.Rckg„ngig:ehp2.&endash.Funktion aufgehoben werden&per.
Bitte sichern sie ihre Originaldatei bevor sie mehrere Ersetzungen durchfhren wollen&per.
:p.
:p.:hp2.Suche&colon.:ehp2. Eingabefeld fr den zu suchenden Text&per.
:p.:hp2.Ersetzen mit&colon.:ehp2. Gefundene Zeichenfolgen werden mit diesem Text ersetzt&per.
Wird in diesem Feld keine Angabe vorgenommen&comma. so wird die gefundene Textstelle gel”scht&per.
:p.:hp2.Groá-/Kleinschreibung beachten&colon.:ehp2. Ist dieser Knopf aktiviert&comma. sucht AE 
Text mit exakter šbereinstimmung&per. Ansonsten wird die Suche nach "box" auch die Ergebnisse "BOX"
oder "Box" anzeigen&per.
:p.:hp2.Von vorn beginnen&colon.:ehp2. Aktivierung dieses Knopfes startet die Suche vom Anfang
der Datei&per. Sonst startet die Suche an der aktuellen Cursorposition&per. Diese Einstellung
wird sofort nach der Suche zurckgesetzt&per.
:p.Die anderen Einstellungen werden fr dei n„chste Nutzung der Suche&endash. oder Ersetze&endash.Funktion gespeichert&per.
:h1 res=5 id='PrintDialog'.
Drucken
:p.Dieses Dialogfenster erlaubt ihnen die Auswahl und Einstellung eines Druckers&per. 
Zum Drucken OK drcken&per.
:p.
:p.:hp2.Drucker:ehp2.
:p.Hier w„hlen sie den Drucker aus, auf den der Text gedruckt werden soll&per.
:p.:hp2.Einrichtung&per.&per.&per.:ehp2.
:p.Einstellung der Druckereigenschaften &lpar.Jobmerkmale&comma. z&per. Bsp&per.
Papierformat&rpar.&per.
:p.:hp2.Alles:ehp2.
:p.Die gesamte Datei wird gedruckt&per.
:p.:hp2.Auswahl:ehp2.
:p.Nur der markierte Text wird gedruckt&per.
:p.:hp2.Print Header:ehp2. 
:p.Bei Auswahl dieser Option wird auf jede Seite eine Kopfzeile in folgender 
Form gedruckt&colon.
:p.&lt.Dateiname&gt.     &lt.Datum und Zeit&gt.     &lt.Seitennummer&gt.
:p.Anmerkung&colon. Funktion beim šbersetzer z&per. Zt&per. nicht vorhanden&per.
:h1 res=4 id='Autosave'.
Automatisches Sichern
:p.AE kann ihre Datei bei der Bearbeitung automatisch sichern&per. Diese Funktion
schtzt vor Datenverlusten bei unerwarteten Computerabstrzen&per. 
:p.Zum Einstellen der Sicherungsfunktion w„hlen sie im Datei-Men "Automatisch sichern"&per. 
Die dabei vorgenommenen Einstellungen werden fr das weitere Arbeiten mit AE gespeichert&per.
:p.W„hrend des automatischen Sicherns erscheint in der Statuszeile von AE eine entsprechende Meldung
&per.
:p.Einstellm”glichkeiten fr automatisches Sichern&colon.
:p.:hp2.Kein automatisches Sichern:ehp2.
:p.Automatisches Sichern ist vollst„ndig abgeschaltet&per.
:p.:hp2.Alles sichern nach X Minuten:ehp2.
:p.AE sichert ihre Datei jeweils nach Ablauf der eingestellten Zeit&per. 
Bitte beachten sie daá der Timer fr die Sicherung erst beginnt&comma. nachdem die erste nderung am Text vorgenommen wurde&per. 
:p.:hp2.Alles sichern nach X nderungen:ehp2.
:p.Diese Einstellung bewirkt eine Sicherung nach einer festgelegten Anzahl von nderungen
in der Datei&per. 
:p.Jeder Buchstabe&comma, welcher gel”scht oder hinzugefgt wird z„hlt als eine nderung&per. 
Ausschneiden oder Einfgen z„hlt als eine nderung&per.
:p.:hp2.Manuelles Sichern erforderlich fr Start:ehp2.
:p.Diese Option ist nur verfgbar wenn automatisches Sichern eingeschaltet ist&per.
:p.Ist diese Option gesetzt&comma. muá eine Datei einmalig manuell gesichert werden&comma.
bevor AE mit automatischem Sichern beginnt&per. Das ist die Grundeinstellungt&per. 
Bitte beachten sie&comma. daá es bei Computerproblemen m”glich ist &comma. bereits vorgenommene nderungen zu verlieren falls sie die erste manuelle Sicherung vergessen&per.
:p.Falls diese Option ausgeschaltet ist&comma. wird AE sofort nach dem Schreiben 
einer neuen Datei mit der automatischen Sicherung beginnen&per. Nach der angegebenen Zeit oder Anzahl von nderungen erscheint in der Statuszeile ein entsprechender Hinweis&per. 
:p.
:p.
:h1 res=6 id='Keys'.
Tastenkrzel
:p.Die meisten Tastenkrzel werden in den Mens angezeigt&per. Daneben gibt es einige zus„tzliche 
Tastenkrzel&comma. welche nicht in den Mens erscheinen&per. 
:p.Nachstehend alle Tastenkrzel von AE v1&per.2&per.2&per.
:p.:hp2.Strg O:ehp2. Datei ”ffnen&per.
:p.:hp2.Strg N:ehp2. Neue Datei &lpar.aktueller Inhalt im Fenster wird gel”scht&rpar.
:p.:hp2.Strg S:ehp2. Sichern der aktuellen Datei 
:p.:hp2.Strg D:ehp2. Sichern der Datei unter anderem Namen
:p.:hp2.Strg P:ehp2. Drucken der Datei oder der Textauswahl
:p.:hp2.Alt F4:ehp2. Beenden&per. Bei nderungen erfolgt eine Abfrage zum Sichern&per.
:p.:hp2.F3:ehp2. Beenden&per. Dies ist die Standardbelegung&per.
:p.Sie k”nnen die Belegung der Taste F3 „ndern zur Funktion "Weitersuchen" zur
Kompatibilit„t mit dem Windows Editor &lpar."Notepad"&rpar. oder „hnlichen Programmen&per. Zur nderung im Men 
Optionen die F3 Tastenbelegung entsprechend ausw„hlen&per.
:p.:hp2.F2:ehp2. Sichern der aktuellen Datei &lpar.wie bei EPM&rpar.&per.
:p.:hp2.Alt Backspace:ehp2. Rckg„ngig
:p.:hp2.Ctrl Z:ehp2. Rckg„ngig
:p.
:p.Es k”nnen sowohl alte und neue Zwischenablage&endash.Tastenkrzel verwendet werden&colon.
:p.:hp2.Umsch Entf:ehp2. Ausgew„hlten Text auschneiden und in Zwischenablage kopieren
:p.:hp2.Strg Einfg:ehp2. Ausgew„hlten Text in Zwischenablage kopieren
:p.:hp2.Umsch Insert:ehp2. Einfgen des Textes aus der Zwischenablage
:p.:hp2.Strg X:ehp2. Ausgew„hlten Text auschneiden und in Zwischenablage kopieren
:p.:hp2.Strg C:ehp2. Ausgew„hlten Text in Zwischenablage kopieren
:p.:hp2.Strg V:ehp2. Einfgen des Textes aus der Zwischenablage
:p.:hp2.Strg A:ehp2. Gesamten Text ausw„hlen&per.
:p.Ist ein Text markiert&comma. so wird er mit Einfgen ersetzt&per.
:p.
:p.:hp2.Strg F:ehp2. Suche nach Textausschnitt &lpar.zeigt den :link reftype=hd
refid='FindDialog'.Suche Text :elink.&endash. Dialog&rpar.
:p.:hp2.Strg G:ehp2. Letzte Suche wiederholen
:p.:hp2.Strg R:ehp2. Textausschnitt suchen und mit anderem ersetzen &lpar.zeigt den :link reftype=hd
refid='Replace Dialog'.Ersetze Text :elink.&endash. Dialog&rpar.
:p.
:p.:hp2.Strg W:ehp2. Schaltet den Zeilenumbruch ein oder aus
:p.
:p.:hp2.F1:ehp2. Hilfe
:p.
:h1 res=7 id='CommandLine'.
Befehlszeilenparameter
:p.AE untersttz einen optionalen Parameter im Zusammenhang mit der šbergabe eines Dateinamens&per.
:p.:hp2.Benutzung&colon.:ehp2.
:p.ae &lbracket.&slash.read&rbracket. &lbracket.&lt.Dateiname&gt.&rbracket.
:p.:hp2.&lt.Dateiname&gt.:ehp2.
:p.Die von AE zu ladende Datei&per. Wird die angegebene Datei nicht gefunden&comma. so
wird eine leeres Fenster erstellt &lpar.Die neue Datei wird erst bei der ersten Sicherung erstellt&rpar.&per.
:p.Wird kein Dateiname angegeben&comma. wird ebenfalls ein leeres Fenster erstellt&per. 
Bei der ersten Sicherung muá ein Dateiname vergeben werden&per.
:p.:hp2.&slash.read:ehp2.
:p.Dieser Parameter schaltet AE in den :link reftype=hd
refid='ReadOnly'.Nur&endash.Lese Modus:elink.&per. 
:p.Anmerkung&colon. Es ist sonderlich sinnvoll &slash.read mit einem neuen Dateinamen 
aufzurufen&xclm.
:h1 res=8 id='ReadOnly'.
Nur&endash.Lese Modus
:p.Der Nur&endash.Lese Modus verhindert das unabsichtliche Ver„ndern der angezeigten 
Datei&per. Dieser Modus kann ein&endash. und ausgeschaltet werden durch Aktivieren bzw&per.
Deaktivieren von "Nur lesen" im Men Optionen&per.
:p.Der Nur&endash.Lese Modus wird automatisch aktiviert beim ™ffnen einer schreibgeschtzten Datei&per. Das Ausschalten des Nur&endash.Lese Modus „ndert nicht das Dateiattribut dieser 
Datei&per. Um eine schreibgeschtzte Datei zu sichern&comma. muá das Schreibschutz&endash.
Attribut der Datei entfernt werden&per.
:p.Der Nur&endash.Lese Modus kann auch durch Start von AE mit dem 
:link reftype=hd refid='CommandLine'.Befehlszeilenparameter:elink. &slash.read eingestellt werden&per.
:h1 res=9 id='FontsAndColors'.
Schriftart und Farben
:p.Schriftart und Farben lassen sich fr den Editierbereich einstellen&per.
:p.Dazu k”nnen sie entweder drag&endash.and&endash.drop von der Farb&endash. und 
Layoutpalette benutzen oder Schriftart&per.&per.&per. und Farben&per.&per.&per. im Men Optionen ausw„hlen&per.
:p.Schriftart&endash. und Farbeinstellungen werden gespeichert&per.
:p.Anmerkung&colon. Schriftarten fr das Programm selbst &lpar.wie in den Mens 
und Dialogen&rpar. werden vom System bernommen&per.
:h1 res=10 id='LargeFileWarning'.
Warnung Dateigr”áe
:p.Diese Warnmeldung wird bei Dateigr”áen ber 1 MB angezeigt&per.
:p.Wie in der :link reftype=hd
refid='Introduction'.Einfhrung:elink. beschrieben funktioniert AE langsam
mit sehr groáen Dateien&per. Dies  hat seine Ursache im OS&slash.2
Presentation Manager "Multi&endash.Line Edit"&comma. und kann daher m”glicherweise
nicht beseitigt werden&per.
:p.Falls sie sehr groáe Dateien bearbeiten und betrachten wollen&comma. sollten sie
gegebenenfalls andere Programme einsetzen&per.
:p.Soll diese Meldung nicht mehr angezeigt werden&comma. aktivieren sie 
"Diese Warnung nicht mehr anzeigen"&per.
:euserdoc.
