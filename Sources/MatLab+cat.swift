//
//  MatLab+cat.swift
//  
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

public extension MatLab {
    ///
    /// cat(dim, A1,A2,…,An) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/cat.html)
    ///
    /// - Parameters:
    ///     - dim: Dimension to operate along.
    ///     - a: List of inputs.
    ///
    /// - Returns:
    ///     Returns a matrix with the concatenates A1, A2, … , An along dimension dim.
    ///
    static func cat<T: Numeric>(_ dim: Int, _ a: Matrix<T>...) -> Matrix<T> {
        switch dim {
        case 1: return horzcat(a)
        case 2: return vertcat(a)
//        case 3: return (3-D Arrays)
        default: return zeros(0)
        }
    }

    ///
    /// horzcat(A1,A2,…,An)function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/horzcat.html)
    ///
    /// - Parameters:
    ///     - a: List of inputs.
    ///
    /// - Returns:
    ///     Returns a matrix with the concatenates A1, A2, … , An along horizontal dimension.
    ///
    static func horzcat<T: Numeric>(_ a: Matrix<T>...) -> Matrix<T> { horzcat(a) }

    ///
    /// horzcat(A1,A2,…,An)function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/horzcat.html)
    ///
    /// - Parameters:
    ///     - a: List of inputs.
    ///
    /// - Returns:
    ///     Returns a matrix with the concatenates A1, A2, … , An along horizontal dimension.
    ///
    static func horzcat<T: Numeric>(_ a: [Matrix<T>]) -> Matrix<T> {
        guard !a.isEmpty else { return zeros(0) }
        let matrix = a[0]
        for i in 1..<a.count {
            precondition(matrix.dimensions[0] == a[i].dimensions[0])
            matrix.dimensions[1] += a[i].dimensions[1]
            for j in 0..<matrix.dimensions[0] {
                matrix.subMatrices[j].dimensions[0] += a[i].subMatrices[j].values.count
                matrix.subMatrices[j].values += a[i].subMatrices[j].values
            }
        }
        return matrix
    }

    ///
    /// vertcat(A1,A2,…,An)function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/vertcat.html)
    ///
    /// - Parameters:
    ///     - a: List of inputs.
    ///
    /// - Returns:
    ///     Returns a matrix with the concatenates A1, A2, … , An along vertical dimension.
    ///
    static func vertcat<T: Numeric>(_ a: Matrix<T>...) -> Matrix<T> { vertcat(a) }

    ///
    /// vertcat(A1,A2,…,An)function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/vertcat.html)
    ///
    /// - Parameters:
    ///     - a: List of inputs.
    ///
    /// - Returns:
    ///     Returns a matrix with the concatenates A1, A2, … , An along vertical dimension.
    ///
    static func vertcat<T: Numeric>(_ a: [Matrix<T>]) -> Matrix<T> {
        guard !a.isEmpty else { return zeros(0) }
        let matrix = a[0]
//        for i in 1..<a.count {
//            precondition(matrix.dimensions[0] == a[i].dimensions[0])
//            matrix.dimensions[1] += a[i].dimensions[1]
//            for j in 0..<matrix.dimensions[0] {
//                matrix.subMatrices[j].dimensions[0] += a[i].subMatrices[j].values.count
//                matrix.subMatrices[j].values += a[i].subMatrices[j].values
//            }
//        }
        return matrix
    }
}
