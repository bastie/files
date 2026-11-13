//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

/// Der Result Builder, der die geschweiften Klammern in ein Array von Regeln übersetzt
@resultBuilder
public struct RulesBuilder {
  public static func buildBlock(_ rules: Rule ...) -> [Rule] {
    return rules
  }
  
  public static func buildArray(_ rules: [[Rule]]) -> [Rule] {
    return rules.flatMap { $0 }
  }
  
  public static func buildOptional(_ rules: [Rule]?) -> [Rule] {
    return rules ?? []
  }
  
  public static func buildEither(first rules: [Rule]) -> [Rule] {
    return rules
  }
  
  public static func buildEither(second rules: [Rule]) -> [Rule] {
    return rules
  }
}
