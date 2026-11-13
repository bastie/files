//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

public enum FileFormatError : Error, Sendable {
  case MISSING_DATA
  case NOT_ENOUGH_DATA
  case UNKNOWN_FILE_FORMAT
}
