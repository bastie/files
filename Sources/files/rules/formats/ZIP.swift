//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

extension _Rules {
  static let ZIP = FileFormatInformation(name: "ZIP archive", mime: "application/zip") {
    BytesRule(offset: 0, bytes: [0x50, 0x4B, 0x03, 0x04])
  }
}
