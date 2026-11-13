//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Testing
@testable import files

import Foundation

/// Test einer PNG Datei
@Test func testPNG_true() async throws {
  let pngRule = Format.PNG
  // Eine PNG Datei nutzen
  let url = Bundle.module.url(forResource: "PNG", withExtension: "png")
  
  // Teste das Ergebnis
  let testErgebnis = try pngRule.match(url : url)
  assert (testErgebnis, "Fehlerhaft Datei PNG.png nicht als PNG erkannt.")
}

/// Test einer Nicht-PNG-Datei
@Test func testPNG_false() async throws {
  let pngRule = Format.PNG

  // Eine TIFF Datei nutzen
  let url = Bundle.module.url(forResource: "TIFF", withExtension: "tiff")
  let testErgebnis = !(try pngRule.match(url : url))
  assert (testErgebnis, "Fehlerhaft Datei TIFF.tiff als PNG erkannt.")
  
}
