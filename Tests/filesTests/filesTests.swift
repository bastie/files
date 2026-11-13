//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import Testing
@testable import files

import Foundation

@Test func testDetect() async throws {
  let url = Bundle.module.url(forResource: "ZIP", withExtension: "zip")
  
  var type : String = "application/octet-stream"
  
  switch (try FileDispatcher.identify(url: url)) {
  case .failure : type = "application/octet-stream"
  case .success(let format) : type = format.rawValue.name
  }
  
  assert(type == Format.ZIP.rawValue.name)
}

