//
//  MatLab+norm.swift
//  
//
//  Created by Damien Noël Dubuisson on 28/10/2021.
//

import Foundation

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
        case 2: return sqrt(v.map { pow(Double($0), 2) }.reduce(0, +)) // sum(abs(X).^2)^(1/2)
        case 3 ..< .max: return .zero // TBD
        case .max: return .zero // TBD
        case .min: return .zero // TBD
        default: return .zero // ERROR: Invalid negative number
        }
    }
}
