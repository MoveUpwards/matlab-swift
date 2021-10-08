//
//  MatLab+zeros.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension MatLab {
    // MARK: - Array

    ///
    /// zeros(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/zeros.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns a 2D array of zeros.
    ///
    static func zeros<T: FloatingPoint>(_ n: Int) -> [[T]] {
        return [[T]](repeating: [T](repeating: .zero, safeCount: n), safeCount: n)
    }

    // MARK: - Matrix

    ///
    /// zeros(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/zeros.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns an n-by-n matrix of zeros.
    ///
    static func zeros<T: FloatingPoint>(_ n: Int) -> Matrix<T> { Matrix(n, n) }

    ///
    /// zeros(sz1,...,szN) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/zeros.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as separate arguments).
    ///
    /// - Returns:
    ///     Returns an sz1-by-...-by-szN array of zeros where sz1,...,szN indicate the size of each dimension.
    ///
    static func zeros<T: FloatingPoint>(_ sz: Int...) -> Matrix<T> { Matrix(sz) }

    ///
    /// zeros(sz) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/zeros.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as a row vector).
    ///
    /// - Returns:
    ///     Returns an array of zeros where size vector sz defines size(X).
    ///
    static func zeros<T: FloatingPoint>(_ sz: [Int]) -> Matrix<T> { Matrix(sz) }
}
