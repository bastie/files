//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Lesen eines Abschnitts einer echten Datei
/// - Note: Der FileHandle wird hier verwaltet. Das schließen des FileHandle in nutzenden Typen ist nicht gestattet.
public struct FilePartReader: Sendable, ~Copyable {
  private let handle : FileHandle
  private let reader : IOHandlePartReader
  
  public init? (url: URL) {
    do {
      guard url.absoluteString.starts(with: "file://") else {
        return nil
      }
      // Öffne das FileHandle für den Lesevorgang
      self.handle = try FileHandle(forReadingFrom: url)
      reader = IOHandlePartReader()
    }
    catch {
      return nil
    }
  }
  
  /// Liest exakt die Anzahl Bytes ab einem Position ein, ohne die Datei komplett zu laden.
  /// - Parameters
  ///    - at Position wo soll begonnen werden (0-basierte Zählung)
  ///    - count der zu lesenden Bytes
  /// - Throws wenn Fehler auftreten
  /// - Returns die Bytes ab der Position
  public func readBytes(at offset: any FixedWidthInteger, count: Int) throws -> Data {
    return try reader.readBytes(from: handle, at: offset, count: count)
  }
  
  /// Typsicherer Ganzzahlen-Leser mit Endianness-Konvertierung
  public func readInteger<T: FixedWidthInteger>(at position: UInt64, endianness: Endianness = .BIG) throws -> T {
    return try reader.readInteger(from: self.handle, at: position, endianness: endianness)
  }
  
  /// Wird automatisch aufgerufen, sobald das struct nicht mehr genutzt wird
  deinit {
    try? handle.close()
  }
}

