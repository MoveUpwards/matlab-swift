//
//  MatLab+diag.swift
//  
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

public extension MatLab {
    ///
    /// diag(v) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/diag.html)
    ///
    /// - Parameters:
    ///     - v: Diagonal elements.
    ///
    /// - Returns:
    ///     Returns a square diagonal matrix with the elements of vector v on the main diagonal.
    ///
    static func diag<T: Numeric>(_ v: [T]) -> Matrix<T> {
        let size = v.count
        var m = Matrix<T>(size, size)
        for i in 0..<v.count {
            m[i, i] = v[i]
        }
        return m
    }

    ///
    /// diag(v, k) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/diag.html)
    ///
    /// - Parameters:
    ///     - v: Diagonal elements.
    ///     - k: Diagonal number.
    ///
    /// - Returns:
    ///     Returns a square diagonal matrix with the elements of vector v on the kth diagonal.
    ///     k=0 represents the main diagonal,
    ///     k>0 is above the main diagonal,
    ///     and k<0 is below the main diagonal.
    ///
    ///
    static func diag<T: Numeric>(_ v: [T], _ k: Int = 0) -> Matrix<T> {
        var m = diag(v)
        for _ in 0..<abs(k) {
            if k > 0 {
                m = horzcat(Matrix<T>(m.dimensions[0], 1), m)
                m = vertcat(m, Matrix<T>(1, m.dimensions[1]))
            } else {
                m = horzcat(m, Matrix<T>(m.dimensions[0], 1))
                m = vertcat(Matrix<T>(1, m.dimensions[1]), m)
            }
        }
        return m
    }
    ///
    /// diag(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/diag.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///
    /// - Returns:
    ///     Returns a column vector of the main diagonal elements of A.
    ///
    static func diag<T: Numeric>(_ a: Matrix<T>, _ k: Int = 0) -> [T] {
        precondition(a.is2dMatrix)
        let count = min(a.dimensions[0], a.dimensions[1]) - abs(k)
        let iOffset = k == 0 ? 0 : k > 0 ? 0 : 1
        let jOffset = k == 0 ? 0 : k > 0 ? 1 : 0
        var result = [T]()
        for i in 0..<count {
            result.append(a[i+iOffset, i+jOffset])
        }
        return result
    }
}
