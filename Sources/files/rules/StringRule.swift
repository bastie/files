//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

/// Prüft Text-Marker 
public struct StringRule: Rule, Sendable {
  public let offset: UInt64
  public let expectedString: String
  
  public init(offset: UInt64, string: String) {
    self.offset = offset
    self.expectedString = string
  }
  
  public func match(handle reader: borrowing FilePartReader) throws -> Bool {
    let data = try reader.readBytes(at: offset, count: expectedString.utf8.count)
    guard let str = String(data: data, encoding: .utf8) else { return false }
    return str == expectedString
  }
}
