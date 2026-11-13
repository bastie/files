# files

<!--
SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
SPDX-License-Identifier: CC0-1.0
-->

Eine Implementation von `file` in Swift für Lernzwecke.

## Architektur

Die `FileFormatInformation` speichern die Informationen zu einem Dateitypen. Eine `FileFormatInformation` wird beschrieben durch
1. Namen
2. Mime-Typ (optional)
3. Regelsystem

Das Regelsystem wird über die `ResultBuilder` Implementation `RulesBuilder` abgebildet. Diese werden in der Enumeration Format gesammelt, welche auf die `FileFormatInformation` im Typ `_Rules` abgebildet werden.


```swift
//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

extension _Rules {
  static let PNG = FileFormatInformation(name: "PNG Image") {
    // 1. PNG Magic Bytes am Offset 0
    ByteMatcher(offset: 0, bytes: [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])
    
    // 2. IHDR Chunk-Identifier am Offset 12
    StringMatcher(offset: 12, string: "IHDR")
  }
}

```

### Rule

`Rule` beschreiben die FileFormat Regeln. Die `Rule` realisieren die eigentlichen Regeln durch Implementierung der Prüflogik. 
- `BytesRule` ermöglicht auf spezielle Bytes abzuprüfen. 
- `StringRules` abstrahiert die Bytes als Zeichenkette.

### Weiterentwicklung

Ein neues Format kann durch Erweiterung von `_Rules` durch weitere Implementierungen von `FileFormatInformation` hinzugefügt werden. Durch das anschließende Hinzufügen dieser Implementierung zur Enumeration `Format` wird dies automatisch erkannt.

Ein neuer Regeltyp kann ergänzt werden durch Implementierung des Protokolls `Rule`.

## Nutzung

Aufruf:
```bash
files file [file...]
```

## Abhängigkeiten
- SwiftArgumentParser

## Lizenz
* Apache 2.0 für Quelltexte
- Creative Commons Zero für Dokumentation
