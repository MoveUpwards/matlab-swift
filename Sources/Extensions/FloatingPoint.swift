//
//  FloatingPoint.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension FloatingPoint {
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
        let tmp = value * 1e16
        guard tmp < Double(Int64.max) else {
            self = .infinity
            return
        }
        guard tmp > Double(Int64.min) else {
            self = -.infinity
            return
        }
        self = Self(Int64(value * 1e16)) / Self(Int64(1e16))
    }
}

public extension Double {
    /// Init with a FloatingPoint or .zero if impossible
    init<Source>(_ value: Source) where Source : FloatingPoint {
        switch value {
        case is Double:
            self = Double(value as? Double ?? .zero)
        case is Float:
            self = Double(value as? Float ?? .zero)
        default:
            self = .zero
        }
    }
}
