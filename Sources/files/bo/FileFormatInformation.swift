//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Sammelt alle Formatregeln für eine Datei
public struct FileFormatInformation : Sendable, Equatable {
  public let name: String
  internal let rules: [Rule]
  public let mimeType: String?
  
  /// Sammelt über einen ResultBuilder die Regeln für den unter name spezifizierten Typ
  public init(name: String, mime: String? = nil, @RulesBuilder _ content: () -> [Rule]) {
    self.name = name
    self.mimeType = mime
    self.rules = content()
  }
  
  // - MARK: Equatable == implementation
  public static func == (lhs: borrowing FileFormatInformation, rhs: borrowing FileFormatInformation) -> Bool {
    // Haben wir den gleichen Namen?
    guard lhs.name == rhs.name else {
      return false
    }
    // Haben wir auch gleich viele Regeln?
    guard lhs.rules.count == rhs.rules.count else {
      return false
    }
    // FIXME: not yet implemented
    return true
  }
  
}
