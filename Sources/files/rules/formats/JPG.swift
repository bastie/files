//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

extension _Rules {
  static let JPG = FileFormatInformation(name: "JPEG Image", mime: "image/jpeg") {
    BytesRule(offset: 0, bytes: [0xFF, 0xD8, 0xFF])
  }
}
