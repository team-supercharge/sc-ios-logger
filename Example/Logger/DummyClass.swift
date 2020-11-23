//
//  DummyClass.swift
//  Logger_Example
//

import Foundation
import Logger

class DummyClass: CustomStringConvertible {
    var property1: Bool = true
    var property2: String = "property2"
    var property3: String = "property3"

    var description: String {
        return "DummyClass(property1: \(property1), property2: \(property2, privacy: .private), property3: \(property3))"
    }
}
