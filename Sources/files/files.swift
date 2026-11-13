//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser

@main struct files : AsyncParsableCommand, CustomStringConvertible {
  
  /// Name des Produkts
  static let NAMED = "files"
  
  /// Unter welchem Namen wurde es aufgerufen auf der Kommandozeile
  static let CALLED = CommandLine.arguments[0]
  
  /// Version des Produkts
  static let VERSION = "0.1"
  
  static let configuration = CommandConfiguration (
    commandName: NAMED,
    abstract: """
      ¯\\_(ツ)_/¯
      file Swift Implementierung
      https://github.com/bastie/files
      """,
    usage: "\(CALLED) <filename>",
    version: "\(NAMED) v\(VERSION)"
  )

  /// Eine Texttuelle Beschreibung (`CustomStringConvertible`) dieses Typs
  var description: String = {"""
    \(NAMED)
    Version \(VERSION)
    """}()
  
  
  mutating func run() throws {
    print(self)
  }
}

