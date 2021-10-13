//
//  MatLab+nan.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension MatLab {
    // MARK: - Array

    ///
    /// nan(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/nan.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns a 2D array of nan.
    ///
    static func nan(_ n: Int) -> [[Double]] {
        return [[Double]](repeating: [Double](repeating: .nan, safeCount: n), safeCount: n)
    }

    // MARK: - Matrix

    ///
    /// nan(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/nan.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns an n-by-n matrix of nan.
    ///
    static func nan(_ n: Int) -> Matrix<Double> { Matrix(value: .nan, n, n) }

    ///
    /// nan(sz1,...,szN) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/nan.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as separate arguments).
    ///
    /// - Returns:
    ///     Returns an sz1-by-...-by-szN array of nan where sz1,...,szN indicate the size of each dimension.
    ///
    static func nan(_ sz: Int...) -> Matrix<Double> { Matrix(value: .nan, sz) }

    ///
    /// nan(sz) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/nan.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as a row vector).
    ///
    /// - Returns:
    ///     Returns an array of nan where size vector sz defines size(X).
    ///
    static func nan(_ sz: [Int]) -> Matrix<Double> { Matrix(value: .nan, sz) }
}
