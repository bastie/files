//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

extension _Rules {
  static let PNG = FileFormatInformation(name: "PNG Image") {
    // 1. PNG Magic Bytes am Offset 0
    BytesRule(offset: 0, bytes: [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])
    
    // 2. IHDR Chunk-Identifier am Offset 12
    StringRule(offset: 12, string: "IHDR")
  }
}
