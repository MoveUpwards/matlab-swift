//
//  File.swift
//  
//
//  Created by Damien Noël Dubuisson on 14/10/2021.
//

public extension MatLab {
    ///
    /// eye(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/eye.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns an n-by-n identity matrix with ones on the main diagonal and zeros elsewhere.
    ///
    static func eye<T: Numeric>(_ n: Int) -> Matrix<T> { diag([T](repeating: .one, safeCount: n)) }

    ///
    /// eye(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/eye.html)
    ///
    /// - Parameters:
    ///     - n: Size of first dimension of I.
    ///     - m: Size of second dimension of I.
    ///
    /// - Returns:
    ///     Returns an n-by-m matrix with ones on the main diagonal and zeros elsewhere.
    ///
    static func eye<T: Numeric>(_ n: Int, _ m: Int) -> Matrix<T> { eye([n, m]) }

    ///
    /// eye(sz) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/eye.html)
    ///
    /// - Parameters:
    ///     - sz: Size of I.
    ///
    /// - Returns:
    ///     Returns an array with ones on the main diagonal and zeros elsewhere. The size vector, sz, defines size(I).
    ///
    static func eye<T: Numeric>(_ sz: [Int]) -> Matrix<T> {
        guard sz.count != 1 else { return eye(sz[0]) }
        guard sz.count == 2 else { return Matrix() } // N-dimensional arrays are not supported.

        var matrix = Matrix(value: T.zero, sz)
        for n in 0..<sz[0] {
            for m in 0..<sz[1] {
                matrix[n, m] = n == m ? .one : .zero
            }
        }
        return matrix
    }
}
