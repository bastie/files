//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

extension _Rules {
  static let PDF = FileFormatInformation(name: "Portable Document Format", mime: "application/pdf") {
    BytesRule(offset: 0, bytes: [0x25, 0x50, 0x44, 0x46, 0x2D])
  }
}
