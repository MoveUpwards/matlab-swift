//
//  Numeric+Double.swift
//  
//
//  Created by Damien Noël Dubuisson on 11/10/2021.
//

public extension Numeric {
    init(_ value: Double) {
        self = Self(exactly: Int64(value * 1e16) / Int64(1e16)) ?? .zero
    }

    var double: Double { Double(self) }
}

public extension Double {
    /// Init with a FloatingPoint or .zero if impossible
    init<Source: Numeric>(_ value: Source) {
        switch value {
        case is Double:
            self = Double(value as? Double ?? .zero)
        case is Float:
            self = Double(value as? Float ?? .zero)
        case let int as Int:
            self = Double(int)
        case let int as Int8:
            self = Double(int)
        case let int as Int16:
            self = Double(int)
        case let int as Int32:
            self = Double(int)
        case let int as Int64:
            self = Double(int)
        case let int as UInt:
            self = Double(int)
        case let int as UInt8:
            self = Double(int)
        case let int as UInt16:
            self = Double(int)
        case let int as UInt32:
            self = Double(int)
        case let int as UInt64:
            self = Double(int)
        default:
            self = .zero
        }
    }
}
