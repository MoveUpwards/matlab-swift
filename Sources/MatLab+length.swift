//
//  MatLab+length.swift
//  
//
//  Created by Damien Noël Dubuisson on 05/11/2021.
//

public extension MatLab {
    ///
    /// length(x) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/length.html)
    ///
    /// - Parameters:
    ///     - x: scalars | vectors | matrices | multidimensional array.
    ///
    /// - Returns:
    ///     Returns the length of the largest array dimension in X.
    ///     For vectors, the length is simply the number of elements.
    ///     For arrays with more dimensions, the length is max(size(X)).
    ///     The length of an empty array is zero.
    ///
    static func length<T: Numeric>(_ x: Vector<T>) -> Int {
        return x.count
    }

    ///
    /// length(x) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/length.html)
    ///
    /// - Parameters:
    ///     - x: scalars | vectors | matrices | multidimensional array.
    ///
    /// - Returns:
    ///     Returns the length of the largest array dimension in X.
    ///     For vectors, the length is simply the number of elements.
    ///     For arrays with more dimensions, the length is max(size(X)).
    ///     The length of an empty array is zero.
    ///
    static func length<T: Numeric>(_ x: Matrix<T>) -> Int {
        return x.dimensions[1]
    }

    ///
    /// length(x) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/length.html)
    ///
    /// - Parameters:
    ///     - x: scalars | vectors | matrices | multidimensional array.
    ///
    /// - Returns:
    ///     Returns the length of the largest array dimension in X.
    ///     For vectors, the length is simply the number of elements.
    ///     For arrays with more dimensions, the length is max(size(X)).
    ///     The length of an empty array is zero.
    ///
    static func length(_ x: Any) -> Int {
        guard let array = x as? Array<Any> else { return 1 }
        guard let array2d = x as? Array<Array<Any>> else { return array.count }
        return array2d.map { $0.count }.max() ?? .zero
    }
}
