//
//  MatLab+squeeze.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension MatLab {
    ///
    /// squeeze(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/squeeze.html)
    ///
    /// - Parameters:
    ///     - a: Input multidimensional array.
    ///
    /// - Returns:
    ///     An array with the same elements as the input array A, but with dimensions of length 1 removed.
    ///
    static func squeeze<T: BinaryInteger>(_ a: [T]) -> [T] {
        return a.filter { $0 != 1 }
    }

    ///
    /// squeeze(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/squeeze.html)
    ///
    /// - Parameters:
    ///     - a: Input multidimensional array.
    ///
    /// - Returns:
    ///     An array with the same elements as the input array A, but with dimensions of length 1 removed.
    ///
    static func squeeze<T: BinaryInteger>(_ a: [[T]]) -> [T] {
        return a.enumerated().filter { i in return i.offset == 0 }.flatMap(\.element)
    }

    ///
    /// squeeze(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/squeeze.html)
    ///
    /// - Parameters:
    ///     - a: Input multidimensional array.
    ///
    /// - Returns:
    ///     An array with the same elements as the input array A, but with dimensions of length 1 removed.
    ///
    static func squeeze<T: FloatingPoint>(_ a: [[T]]) -> [T] {
        return a.enumerated().filter { i in return i.offset == 0 }.flatMap(\.element)
    }
}
