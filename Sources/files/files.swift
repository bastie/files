//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation

@main struct files : AsyncParsableCommand, CustomStringConvertible {
  
  /// Name des Produkts
  static let NAMED = "files"
  
  /// Unter welchem Namen wurde es aufgerufen auf der Kommandozeile
  static let CALLED = CommandLine.arguments[0]
  
  /// Version des Produkts
  static let VERSION = "1.0"
  
  static let configuration = CommandConfiguration (
    commandName: NAMED,
    abstract: """
      ¯\\_(ツ)_/¯
      file Swift Implementierung
      https://github.com/bastie/files
      """,
    usage: "\(CALLED) <filename>",
    version: """
    \(NAMED)-\(VERSION)
    magic included
    """
  )

  /// Eine Texttuelle Beschreibung (`CustomStringConvertible`) dieses Typs
  var description: String = {"""
    \(NAMED)
    Version \(VERSION)
    """}()
  
  @Argument(help: "files to check")
  var files : [String]
  
  mutating func run() throws {
    for file in files {
      var result : Format?
      switch (try FileDispatcher.identify(url: URL(filePath: file))) {
      case .failure : result = nil
      case .success(let format) : result = format
      }
      
      if let result {
        // MARK: hier können zusätzliche Informationen gesammelt werden
        
        print ("""
          \(file): \(result.rawValue.name)
          """)
      }
    }
  }
}

