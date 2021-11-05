//
//  MatLab+rdivide.swift
//  
//
//  Created by Damien Noël Dubuisson on 05/11/2021.
//

public extension MatLab {
    // MARK: - Scalars

    ///
    /// rdivide(a, b) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rdivide.html)
    ///
    /// - Parameters:
    ///     - a: scalars | vectors | matrices.
    ///     - b: scalars | vectors | matrices.
    ///
    /// - Returns:
    ///     Divides each element of A by the corresponding element of B.
    ///
    static func rdivide<T: Numeric>(_ a: Matrix<T>, _ b: T) -> Matrix<T> {
        return a / b
    }

    ///
    /// rdivide(a, b) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rdivide.html)
    ///
    /// - Parameters:
    ///     - a: scalars | vectors | matrices.
    ///     - b: scalars | vectors | matrices.
    ///
    /// - Returns:
    ///     Divides each element of A by the corresponding element of B.
    ///
    static func rdivide<T: Numeric>(_ a: T, _ b: Matrix<T>) -> Matrix<T> {
        return a / b
    }

    // MARK: - Vectors

    ///
    /// rdivide(a, b) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rdivide.html)
    ///
    /// - Parameters:
    ///     - a: scalars | vectors | matrices.
    ///     - b: scalars | vectors | matrices.
    ///
    /// - Returns:
    ///     Divides each element of A by the corresponding element of B.
    ///
    static func rdivide<T: Numeric>(_ a: Vector<T>, _ b: T) -> Vector<T> {
        return a / b
    }

    ///
    /// rdivide(a, b) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rdivide.html)
    ///
    /// - Parameters:
    ///     - a: scalars | vectors | matrices.
    ///     - b: scalars | vectors | matrices.
    ///
    /// - Returns:
    ///     Divides each element of A by the corresponding element of B.
    ///
    static func rdivide<T: Numeric>(_ a: T, _ b: Vector<T>) -> Vector<T> {
        return a / b
    }

    // MARK: - Matrices

    ///
    /// rdivide(a, b) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/rdivide.html)
    ///
    /// - Parameters:
    ///     - a: scalars | vectors | matrices.
    ///     - b: scalars | vectors | matrices.
    ///
    /// - Returns:
    ///     Divides each element of A by the corresponding element of B.
    ///
    static func rdivide<T: Numeric>(_ a: Matrix<T>, _ b: Matrix<T>) -> Matrix<T> {
        guard a.dimensions != b.dimensions else {
            var result: Matrix<T> = Matrix(a.dimensions)
            let bValues = b.allValues
            result.allValues = Vector(a.allValues.datas.enumerated().map { (offset, element) in element / bValues[offset] })
            return result
        }

        let isHorizontal = a.dimensions[0] == 1 && b.dimensions[1] == 1
        let isVertical = a.dimensions[1] == 1 && b.dimensions[0] == 1
        precondition(isHorizontal || isVertical)

        if isHorizontal {
            return Matrix(array: b.allValues.map { Array(a.allValues / $0) })
        } else {
            return Matrix(array: a.allValues.map { Array($0 / b.allValues) })
        }
    }
}
