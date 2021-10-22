//
//  File.swift
//  
//
//  Created by Damien Noël Dubuisson on 21/10/2021.
//

public extension MatLab {
    ///
    /// plus(a, b) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/plus.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///     - b: Input matrix.
    ///
    /// - Returns:
    ///     Returns the addition of the matrix A to matrix B.
    ///
    static func plus<T: Numeric>(_ a: Matrix<T>, _ b: Matrix<T>) -> Matrix<T> {
        precondition(a.is2dMatrix && b.is2dMatrix)
        guard a.dimensions != b.dimensions else {
            return a + b // If a and b have the same dimension we add matrix normally
        }
        guard a.rowsCount == b.rowsCount else {
            guard a.columnsCount == 1, b.rowsCount == 1 else { return Matrix() }

            var matrix = Matrix(value: T.zero, a.rowsCount, b.columnsCount)
            for i in 0..<matrix.rowsCount {
                matrix.subMatrices[i].values = a[i, 0] + b.values
            }
            return matrix
        }

        guard b.columnsCount == 1 else { return Matrix() }
        var matrix = a
        for i in 0..<matrix.rowsCount {
            for j in 0..<matrix.columnsCount {
                matrix[i, j] += b[i, 0]
            }
        }
        return matrix
    }
}
