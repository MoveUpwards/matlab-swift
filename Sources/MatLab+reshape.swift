//
//  MatLab+reshape.swift
//  
//
//  Created by Damien Noël Dubuisson on 26/10/2021.
//

public extension MatLab {

    ///
    /// reshape(a, sz1,...,szN) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/reshape.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///     - sz: Size of each dimension (as separate arguments). You can specify a single dimension size of [] to have the dimension
    ///     size automatically calculated, such that the number of elements in B matches the number of elements in A.
    ///
    /// - Returns:
    ///     Reshapes A using the size vector, sz, to define size(B).
    ///
    static func reshape<T: Numeric>(_ a: Matrix<T>, _ sz: Int...) -> Matrix<T> { reshape(a, sz) }

    ///
    /// reshape(a, sz) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/reshape.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///     - sz: Size of each dimension. You can specify a single dimension size of [] to have the dimension
    ///     size automatically calculated, such that the number of elements in B matches the number of elements in A.
    ///
    /// - Returns:
    ///     Reshapes A using the size vector, sz, to define size(B).
    ///
    static func reshape<T: Numeric>(_ a: Matrix<T>, _ sz: [Int]) -> Matrix<T> {
        let count = a.valuesCount
        var dim = sz
        if let index = dim.firstIndex(of: -1) {
            guard let newValue = findDim(from: dim, total: count) else { return Matrix() }
            dim[index] = newValue
        }

        var matrix: Matrix<T> = zeros(dim)
        matrix.allColumnsValues = a.allColumnsValues
//        if a.is2dMatrix {
//        matrix.allValues = a.allColumnsValues
//        } else {
//            matrix.allColumnsValues = a.allValues
//        }
        return matrix
    }

    // If only one dimension is -1, return the one to match total expected values
    private static func findDim(from dim: [Int], total: Int) -> Int? {
        guard dim.isUnique(-1) else { return nil }
        let v = -dim.reduce(1, *) // -1 will change the sign
        guard v < total else { return nil }
        let newValue = total / v
        guard v * newValue == total else { return nil }
        return newValue
    }
}
