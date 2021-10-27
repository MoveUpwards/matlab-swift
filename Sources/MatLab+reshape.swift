//
//  MatLab+reshape.swift
//  
//
//  Created by Damien Noël Dubuisson on 26/10/2021.
//

public extension MatLab {
    // MARK: - Array

    ///
    /// reshape(a, sz) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/reshape.html)
    ///
    /// - Parameters:
    ///     - a: Input array.
    ///     - sz: Output size.
    ///
    /// - Returns:
    ///     Returns a 2D array of rand.
    ///
    static func reshape<T: Numeric>(_ a: [T], _ sz: [Int]) -> Matrix<T> {
        precondition(sz.count == 2) // Only on 2D matrix
        precondition(sz[0] * sz[1] == a.count)
        var matrix = Matrix<T>(sz)
        matrix.allColumnsValues = Vector(a)
        return matrix
    }
}
