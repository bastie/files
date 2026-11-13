//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct IOHandlePartReader : Sendable {
  
  /// Liest exakt die Anzahl Bytes ab einem Position ein, ohne die Daten komplett zu laden.
  /// - Parameters
  ///    - at Position wo soll begonnen werden (0-basierte Zählung)
  ///    - count der zu lesenden Bytes
  /// - Throws IOError wenn Fehler auftreten
  /// - Returns die Bytes ab der Position
  public func readBytes(from handle : FileHandle, at position: any FixedWidthInteger, count: Int) throws (FileFormatError) -> Data {
    var daten = Data ()
    do {
      // Zu der gewünschten Position springen
      try handle.seek(toOffset: UInt64(position))
      
      // Liest maximal die Anzahl von Bytes in ein Data-Objekt ein
      daten = try handle.read(upToCount: count)!
    }
    catch {
      throw FileFormatError.MISSING_DATA
    }
    
    // Postcondition
    if daten.count < count {
      throw FileFormatError.MISSING_DATA
    }
    
    return daten
  }
  
  /// Typsicherer Ganzzahlen-Leser mit Endianness-Konvertierung
  public func readInteger<T: FixedWidthInteger>(from handle : FileHandle, at position: UInt64, endianness: Endianness = .BIG) throws -> T {
    let byteCount = MemoryLayout<T>.size
    let bytes = try readBytes (from: handle, at: position, count: byteCount)
    
    guard bytes.count == byteCount else {
      throw FileFormatError.NOT_ENOUGH_DATA
    }
    
    return bytes.withUnsafeBytes { ptr in
      let rawValue = ptr.load(as: T.self)
      switch endianness {
      case .BIG:
        return T(bigEndian: rawValue)
      case .LITTLE:
        return T(littleEndian: rawValue)
      }
    }
  }
}
