//
//  MatLab+eig.swift
//  
//
//  Created by Damien Noël Dubuisson on 02/11/2021.
//

public extension MatLab {
    ///
    /// eig(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/eig.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///
    /// - Returns:
    ///     Returns a column vector containing the eigenvalues of square matrix A.
    ///
    static func eig<T: Numeric>(_ a: Matrix<T>) -> Matrix<Double> {
        precondition(a.is2dMatrix)
        return Matrix()
    }
}
