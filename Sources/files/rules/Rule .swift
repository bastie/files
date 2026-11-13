//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Protokoll für alle prüfbaren Elemente in der DSL
public protocol Rule : Sendable {
  func match (handle reader: borrowing FilePartReader) throws -> Bool
}


