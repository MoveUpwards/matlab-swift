//
//  File.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

// See Int+colon.swift
// https://www.mathworks.com/help/matlab/ref/colon.html

public extension MatLab {
    ///
    /// colon(j,k) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/colon.html)
    ///
    /// - Parameters:
    ///     - j: Starting vector value.
    ///     - k: Ending vector value.
    ///
    /// - Returns:
    ///     Regularly-spaced vector.
    ///
    static func colon<T: BinaryInteger>(_ j: T, _ k: T) -> [T] { colon(j, 1, k) }

    ///
    /// colon(j,i,k) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/colon.html)
    ///
    /// - Parameters:
    ///     - j: Starting vector value.
    ///     - i: Increment between vector elements.
    ///     - k: Ending vector value.
    ///
    /// - Returns:
    ///     Regularly-spaced vector.
    ///
    static func colon<T: BinaryInteger>(_ j: T, _ i: T, _ k: T) -> [T] {
        guard i != .zero, i > .zero ? k > j : k < j else { return [] }

        var value = j
        var array = [T]()
        while i > .zero ? value <= k : value >= k {
            array.append(value)
            value += i
        }

        return array
    }

    ///
    /// colon(j,i,k) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/colon.html)
    ///
    /// - Parameters:
    ///     - j: Starting vector value.
    ///     - i: Increment between vector elements.
    ///     - k: Ending vector value.
    ///
    /// - Returns:
    ///     Regularly-spaced vector.
    ///
    static func colon<T: Numeric & Comparable, U: FloatingPoint>(_ j: T, _ i: U, _ k: T) -> [U] {
        guard i != .zero, i > .zero ? k > j : k < j else { return [] }

        // See: https://floating-point-gui.de
        // Use dummy * 100 to avoid 0.2 + 0.1 rounding error
        var value = j * T(100)
        let last = k * T(100)
        var array = [U(value) / U(100)]
        value += T(Double(i * U(100)))

        while i > .zero ? value <= last : value >= last {
            array.append(U(value) / U(100))
            value += T(Double(i * U(100)))
        }

        return array
    }

//    static func colon<T: FloatingPoint>(_ j: T, _ i: T.Stride, _ k: T) -> [T] {
//        Array(stride(from: j, through: k, by: i))
//    }
//    // stride(from: 0.0, through: 1.0, by: 0.1)
//    // give: [0.0, 0.1, 0.2, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001, 0.7000000000000001, 0.8, 0.9, 1.0]
//    // expect: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
}
