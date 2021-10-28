//
//  MatLab+mean.swift
//  
//
//  Created by Damien Noël Dubuisson on 28/10/2021.
//

public extension MatLab {
    ///
    /// mean(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/mean.html)
    ///
    /// - Parameters:
    ///     - a: Input array.
    ///
    /// - Returns:
    ///     Returns the mean of the elements of A along the first array dimension whose size does not equal 1.
    ///
    static func mean<T: Numeric>(_ a: [T]) -> Double {
        return Double(a.reduce(0, +)) / Double(a.count)
    }
    ///
    /// mean(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/mean.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///
    /// - Returns:
    ///     Returns the mean of the elements of A along the first array dimension whose size does not equal 1.
    ///
    static func mean<T: Numeric>(_ a: Matrix<T>, _ dim: Int = 1) -> [Double] {
        switch dim {
        case ...0: return [] // Invalid dimension
        case 1: return a.columns.map { mean($0) }
        case 2: return a.rows.map { mean($0) }
        default: return [] // TBD
        }
    }
}
