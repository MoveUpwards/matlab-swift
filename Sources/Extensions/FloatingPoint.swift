//
//  FloatingPoint.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension FloatingPoint {
    /// A very close to 0 number
    static var epsilon: Self { Self(8.85418782e-12) }

    /// Cast a Double to FloatingPoint
    init(_ value: Double) {
        guard !value.isNaN else {
            self = .nan
            return
        }
        guard !value.isInfinite else {
            self = .infinity
            return
        }
        self = Self(Int64(value * 1e16)) / Self(Int64(1e16))
    }

    /// Init with a Numeric or .zero if impossible
    init<T: Numeric>(_ value: T) {
        switch value {
        case is Double:
            self = Self(value as? Double ?? .zero)
        case is Float:
            self = Self(Double(value))
        case let int as Int:
            self = Self(int)
        case let int as Int8:
            self = Self(int)
        case let int as Int16:
            self = Self(int)
        case let int as Int32:
            self = Self(int)
        case let int as Int64:
            self = Self(int)
        case let int as UInt:
            self = Self(int)
        case let int as UInt8:
            self = Self(int)
        case let int as UInt16:
            self = Self(int)
        case let int as UInt32:
            self = Self(int)
        case let int as UInt64:
            self = Self(int)
        default:
            self = .zero
        }
    }
}

public func hypot<T: FloatingPoint>(_ x: T, _ y: T) -> T { (x*x + y*y).squareRoot() }
