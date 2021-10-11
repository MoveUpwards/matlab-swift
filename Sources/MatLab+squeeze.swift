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
    ///     Returns an array with the same elements as the input array A, but with dimensions of length 1 removed..
    ///
    static func squeeze<T: Numeric>(_ a: Matrix<T>) -> Matrix<T> {
        return a
    }
}
