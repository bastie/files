//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Die Regeln als Enumeration
public enum Format : RawRepresentable, CaseIterable, Rule {
  public typealias RawValue = FileFormatInformation
  
  case JPG
  case PDF
  case PNG
  case ZIP
  
  public init?(rawValue: FileFormatInformation) {
    switch rawValue {
    case _Rules.JPG:    self = .JPG
    case _Rules.PDF:    self = .PDF
    case _Rules.PNG:    self = .PNG
    case _Rules.ZIP:    self = .ZIP
    default:
      return nil
    }
  }
  
  public var rawValue: FileFormatInformation {
    switch self {
    case .JPG:    return _Rules.JPG
    case .PDF:    return _Rules.PDF
    case .PNG:    return _Rules.PNG
    case .ZIP:    return _Rules.ZIP
    }
  }
  
  /// Prüfe, ob das Format passt.
  public func match (handle reader: borrowing FilePartReader) throws -> Bool {
    for rule in self.rawValue.rules {
      if try !rule.match(handle: reader) {
        return false
      }
    }
    return true
  }
  
  /// Prüfe, ob das Format passt.
  public func match (url : URL?) throws -> Bool {
    if let url {
      if let handle = FilePartReader(url: url) {
        return try self.match(handle: handle)
      }
    }
    return false
  }

}

/// Mein geheimer Typ für die eigentlichen Regeln
internal enum _Rules {}
