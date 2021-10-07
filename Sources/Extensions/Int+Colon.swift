//
//  Int+Colon.swift
//  
//
//  Created by Damien Noël Dubuisson on 18/05/2021.
//

infix operator ∶ : MultiplicationPrecedence

extension BinaryInteger {
    ///
    /// colon function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/colon.html)
    /// Creates a unit-spaced vector x with elements [j,j+1,j+2,...,j+m] where m = fix(k-j).
    ///
    /// **use** RATIO = Unicode: U+2236, UTF-8: E2 88 B6
    /// 
    /// **Do not use** COLON (Unicode: U+003A, UTF-8: 3A)
    ///
    /// - Parameters:
    ///     - left: Starting number.
    ///     - right: Last number.
    ///
    /// - Returns:
    ///     Array of all elements created.
    ///
    public static func ∶(left: Self, right: Self) -> [Self] {
        return Array(stride(from: left, through: right, by: 1))
    }
}
