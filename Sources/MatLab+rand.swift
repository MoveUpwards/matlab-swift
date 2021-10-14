//
//  MatLab+rand.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension MatLab {
    // MARK: - Array

    ///
    /// rand(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rand.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns a 2D array of rand.
    ///
    static func rand(_ n: Int) -> [[Double]] {
        return [[Double]](repeating: [Double](repeating: .random(in: 0...1), safeCount: n), safeCount: n)
    }

    // MARK: - Matrix

    ///
    /// rand(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rand.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns an n-by-n matrix of rand.
    ///
    static func rand(_ n: Int) -> Matrix<Double> { Matrix(value: .random(in: 0...1), n, n) }

    ///
    /// rand(sz1,...,szN) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rand.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as separate arguments).
    ///
    /// - Returns:
    ///     Returns an sz1-by-...-by-szN array of rand where sz1,...,szN indicate the size of each dimension.
    ///
    static func rand(_ sz: Int...) -> Matrix<Double> { rand(sz) }

    ///
    /// rand(sz) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rand.html)
    ///
    /// - Parameters:
    ///     - sz: Size of each dimension (as a row vector).
    ///
    /// - Returns:
    ///     Returns an array of rand where size vector sz defines size(X).
    ///
    static func rand(_ sz: [Int]) -> Matrix<Double> { Matrix(value: .random(in: 0...1), sz) }
}
