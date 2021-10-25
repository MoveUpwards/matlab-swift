//
//  Numeric+Double.swift
//  
//
//  Created by Damien Noël Dubuisson on 11/10/2021.
//

public extension Numeric {
    static var one: Self { .zero + 1 }

    /// Calculates the additive inverse of a value.
    ///
    /// The unary minus operator (prefix `-`) calculates the negation of its
    /// operand. The result is always exact.
    ///
    ///     let x = 21.5
    ///     let y = -x
    ///     // y == -21.5
    ///
    /// - Parameter operand: The value to negate.
    /// 
    prefix static func - (x: Self) -> Self { x * -1 }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    static func < (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (let left as Double, let right as Double):     return left < right
        case (let left as Float, let right as Float):       return left < right
        case (let left as Int, let right as Int):           return left < right
        case (let left as Int8, let right as Int8):         return left < right
        case (let left as Int16, let right as Int16):       return left < right
        case (let left as Int32, let right as Int32):       return left < right
        case (let left as Int64, let right as Int64):       return left < right
        case (let left as UInt, let right as UInt):         return left < right
        case (let left as UInt8, let right as UInt8):       return left < right
        case (let left as UInt16, let right as UInt16):     return left < right
        case (let left as UInt32, let right as UInt32):     return left < right
        case (let left as UInt64, let right as UInt64):     return left < right
        default: return false
        }
    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    static func <= (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (let left as Double, let right as Double):     return left <= right
        case (let left as Float, let right as Float):       return left <= right
        case (let left as Int, let right as Int):           return left <= right
        case (let left as Int8, let right as Int8):         return left <= right
        case (let left as Int16, let right as Int16):       return left <= right
        case (let left as Int32, let right as Int32):       return left <= right
        case (let left as Int64, let right as Int64):       return left <= right
        case (let left as UInt, let right as UInt):         return left <= right
        case (let left as UInt8, let right as UInt8):       return left <= right
        case (let left as UInt16, let right as UInt16):     return left <= right
        case (let left as UInt32, let right as UInt32):     return left <= right
        case (let left as UInt64, let right as UInt64):     return left <= right
        default: return false
        }
    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    static func > (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (let left as Double, let right as Double):     return left > right
        case (let left as Float, let right as Float):       return left > right
        case (let left as Int, let right as Int):           return left > right
        case (let left as Int8, let right as Int8):         return left > right
        case (let left as Int16, let right as Int16):       return left > right
        case (let left as Int32, let right as Int32):       return left > right
        case (let left as Int64, let right as Int64):       return left > right
        case (let left as UInt, let right as UInt):         return left > right
        case (let left as UInt8, let right as UInt8):       return left > right
        case (let left as UInt16, let right as UInt16):     return left > right
        case (let left as UInt32, let right as UInt32):     return left > right
        case (let left as UInt64, let right as UInt64):     return left > right
        default: return false
        }
    }

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    static func >= (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (let left as Double, let right as Double):     return left >= right
        case (let left as Float, let right as Float):       return left >= right
        case (let left as Int, let right as Int):           return left >= right
        case (let left as Int8, let right as Int8):         return left >= right
        case (let left as Int16, let right as Int16):       return left >= right
        case (let left as Int32, let right as Int32):       return left >= right
        case (let left as Int64, let right as Int64):       return left >= right
        case (let left as UInt, let right as UInt):         return left >= right
        case (let left as UInt8, let right as UInt8):       return left >= right
        case (let left as UInt16, let right as UInt16):     return left >= right
        case (let left as UInt32, let right as UInt32):     return left >= right
        case (let left as UInt64, let right as UInt64):     return left >= right
        default: return false
        }
    }

    /// Multiplies two values and produces their product, rounding to a
    /// representable value.
    ///
    /// The multiplication operator (`*`) calculates the product of its two
    /// arguments. For example:
    ///
    ///     let x = 7.5
    ///     let y = x * 2.25
    ///     // y == 16.875
    ///
    /// The `*` operator implements the multiplication operation defined by the
    /// [IEEE 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
//    static func * (lhs: Self, rhs: Self) -> Self {
//        switch (lhs, rhs) {
//        case (let left as Double, let right as Double): return left * right
//        case (let left as Float, let right as Float): return left * right
//        case (let left as Int, let right as Int): return left * right
//        case (let left as Int8, let right as Int8): return left * right
//        case (let left as Int16, let right as Int16): return left * right
//        case (let left as Int32, let right as Int32): return left * right
//        case (let left as Int64, let right as Int64): return left * right
//        case (let left as UInt, let right as UInt): return left * right
//        case (let left as UInt8, let right as UInt8): return left * right
//        case (let left as UInt16, let right as UInt16): return left * right
//        case (let left as UInt32, let right as UInt32): return left * right
//        case (let left as UInt64, let right as UInt64): return left * right
//        default: return .zero
//        }
//    }

    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`/`) calculates the quotient of the division if
    /// `rhs` is nonzero. If `rhs` is zero, the result of the division is
    /// infinity, with the sign of the result matching the sign of `lhs`.
    ///
    ///     let x = 16.875
    ///     let y = x / 2.25
    ///     // y == 7.5
    ///
    ///     let z = x / 0
    ///     // z.isInfinite == true
    ///
    /// The `/` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    static func / <T: Numeric>(lhs: Self, rhs: Self) -> T {
        switch (lhs, rhs) {
        case (let left as Double, let right as Double):     return T(left / right)
        case (let left as Float, let right as Float):       return T(left / right)
        case (let left as Int, let right as Int):           return T(left / right)
        case (let left as Int8, let right as Int8):         return T(left / right)
        case (let left as Int16, let right as Int16):       return T(left / right)
        case (let left as Int32, let right as Int32):       return T(left / right)
        case (let left as Int64, let right as Int64):       return T(left / right)
        case (let left as UInt, let right as UInt):         return T(left / right)
        case (let left as UInt8, let right as UInt8):       return T(left / right)
        case (let left as UInt16, let right as UInt16):     return T(left / right)
        case (let left as UInt32, let right as UInt32):     return T(left / right)
        case (let left as UInt64, let right as UInt64):     return T(left / right)
        default: return .zero
        }
    }
}

public extension Numeric {
    init(_ value: Double) {
        guard !value.isNaN, abs(value).isFinite else { self = .zero; return }
        guard value.isFinite else {
            self = .zero
            return
        }
        self = (value as? Self) ?? .zero
    }
    init(_ value: Float) {
        guard !value.isNaN, abs(value).isFinite else { self = .zero; return }
        guard value.isFinite else {
            self = .zero
            return
        }
        self = (value as? Self) ?? .zero
    }

    init(_ value: Int) { self = Self(exactly: value) ?? .zero }
    init(_ value: Int8) { self = Self(exactly: value) ?? .zero }
    init(_ value: Int16) { self = Self(exactly: value) ?? .zero }
    init(_ value: Int32) { self = Self(exactly: value) ?? .zero }
    init(_ value: Int64) { self = Self(exactly: value) ?? .zero }
    init(_ value: UInt) { self = Self(exactly: value) ?? .zero }
    init(_ value: UInt8) { self = Self(exactly: value) ?? .zero }
    init(_ value: UInt16) { self = Self(exactly: value) ?? .zero }
    init(_ value: UInt32) { self = Self(exactly: value) ?? .zero }
    init(_ value: UInt64) { self = Self(exactly: value) ?? .zero }
}

public extension Double {
    /// Init with a FloatingPoint or .zero if impossible
    init<Source: Numeric>(_ value: Source) {
        switch value {
        case is Double:             self = Double(value as? Double ?? .zero)
        case is Float:              self = Double(value as? Float ?? .zero)
        case let int as Int:        self = Double(int)
        case let int as Int8:       self = Double(int)
        case let int as Int16:      self = Double(int)
        case let int as Int32:      self = Double(int)
        case let int as Int64:      self = Double(int)
        case let int as UInt:       self = Double(int)
        case let int as UInt8:      self = Double(int)
        case let int as UInt16:     self = Double(int)
        case let int as UInt32:     self = Double(int)
        case let int as UInt64:     self = Double(int)
        default:                    self = .zero
        }
    }
}
