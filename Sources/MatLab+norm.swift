//
//  MatLab+norm.swift
//  
//
//  Created by Damien Noël Dubuisson on 28/10/2021.
//

public extension MatLab {
    ///
    /// norm(v, p) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/norm.html)
    ///
    /// - Parameters:
    ///     - v: Input vector.
    ///     - p: Norm type.
    ///
    /// - Returns:
    ///     Returns the Euclidean norm of vector v. This norm is also called the 2-norm, vector magnitude, or Euclidean length.
    ///
    static func norm<T: Numeric>(_ v: Vector<T>, _ p: Int = 2) -> Double {
        switch p {
        case 1: return v.map { abs(Double($0)) }.reduce(0, +) // sum(abs(X))
        case 2: return (v.map { Double($0 * $0) }.reduce(0, +)).squareRoot() // sum(abs(X).^2)^(1/2)
        case 3 ..< .max: return .zero // TODO: sum(abs(X).^p)^(1/p)
        case .max: return .zero // TODO: max(abs(X))
        case .min: return .zero // TODO: min(abs(X))
        default: return .zero // ERROR: Invalid negative number
        }
    }

    ///
    /// norm(x, p) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/norm.html)
    ///
    /// - Parameters:
    ///     - x: Input matrix.
    ///     - p: Norm type.
    ///
    /// - Returns:
    ///     Returns the Euclidean norm of vector v. This norm is also called the 2-norm, vector magnitude, or Euclidean length.
    ///
    static func norm<T: Numeric>(_ x: Matrix<T>, _ p: Int = 2) -> Double {
        switch p {
        case 1: return .zero // max(sum(abs(X)))
        case 2: return MatLab.svd(x).s.max() ?? .zero // max(svd(X))
        case .max: return .zero // TODO: max(sum(abs(X')))
        default: return .zero // ERROR: Invalid number
        }
    }
}
