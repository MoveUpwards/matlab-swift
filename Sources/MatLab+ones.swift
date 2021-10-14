//
//  MatLab+ones.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension MatLab {
    // MARK: - Array

    ///
    /// ones(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/ones.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns a 2D array of ones.
    ///
    static func ones<T: Numeric>(_ n: Int) -> [[T]] {
        return [[T]](repeating: [T](repeating: T(1), safeCount: n), safeCount: n)
    }

    // MARK: - Matrix

    ///
    /// ones(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/ones.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns an n-by-n matrix of ones.
    ///
    static func ones<T: Numeric>(_ n: Int) -> Matrix<T> { Matrix(value: T(1), n, n) }

    ///
    /// ones(sz1,...,szN) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/ones.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as separate arguments).
    ///
    /// - Returns:
    ///     Returns an sz1-by-...-by-szN array of ones where sz1,...,szN indicate the size of each dimension.
    ///
    static func ones<T: Numeric>(_ sz: Int...) -> Matrix<T> { ones(sz) }

    ///
    /// ones(sz) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/ones.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as a row vector).
    ///
    /// - Returns:
    ///     Returns an array of ones where size vector sz defines size(X).
    ///
    static func ones<T: Numeric>(_ sz: [Int]) -> Matrix<T> { Matrix(value: T(1), sz) }
}
