//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Testing
@testable import files

import Foundation

@Test func testZIP() async throws {
  
  let rule = Format.ZIP
  let url = Bundle.module.url(forResource: "ZIP", withExtension: "zip")
  
  // Teste das Ergebnis
  let testErgebnis = try rule.match(url: url)
  assert (testErgebnis, "Fehlerhaft Datei ZIP.zip nicht als ZIP erkannt.")
  
}
