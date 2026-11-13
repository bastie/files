//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Prüft exakte Byte-Sequenzen an einem Offset (z. B. Magic Numbers)
public struct BytesRule: Rule, Sendable {
  public let offset: UInt64
  public let expectedBytes: Data
  
  public init(offset: UInt64, bytes: [UInt8]) {
    self.offset = offset
    self.expectedBytes = Data(bytes)
  }
  
  public init(offset: UInt64, data: Data) {
    self.offset = offset
    self.expectedBytes = data
  }
  
  public func match(handle reader: borrowing FilePartReader) throws -> Bool {
    let readBytes = try reader.readBytes(at: offset, count: expectedBytes.count)
    return readBytes == expectedBytes
  }
}

