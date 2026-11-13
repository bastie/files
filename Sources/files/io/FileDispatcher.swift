//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

public enum FileDispatcher: Sendable {
  
  /// Prüft die Datei nacheinander gegen alle registrierten Regeln
  /// und gibt den Namen des ersten erkannten Formats zurück.
  public static func identify(url: URL?) throws -> Result<Format, FileFormatError> {
    if let url {
      
      let format : Format? = try {
        for rule in Format.allCases {
          if try rule.match(url: url) {
            return rule
          }
        }
        return nil
      }()
      
      if let format {
        return .success(format)
      }
      
    }
    return .failure(.UNKNOWN_FILE_FORMAT)
  }
}

