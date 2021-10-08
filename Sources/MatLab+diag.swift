//
//  MatLab+diag.swift
//  
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

public extension MatLab {
    ///
    /// diag(v) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/diag.html)
    ///
    /// - Parameters:
    ///     - v: Diagonal elements.
    ///
    /// - Returns:
    ///     Returns a square diagonal matrix with the elements of vector v on the main diagonal.
    ///
    static func diag<T: Numeric>(_ v: [T]) -> Matrix<T> {
        let size = v.count
        let m = Matrix<T>(size, size)
        for i in 0..<v.count {
            print(m[0].values)
            m[i, i] = v[i]
        }
        return m
    }

//    ///
//    /// diag(v, k) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/diag.html)
//    ///
//    /// - Parameters:
//    ///     - v: Diagonal elements.
//    ///     - k: Diagonal number.
//    ///
//    /// - Returns:
//    ///     Returns a square diagonal matrix with the elements of vector v on the kth diagonal.
//    ///     k=0 represents the main diagonal,
//    ///     k>0 is above the main diagonal,
//    ///     and k<0 is below the main diagonal.
//    ///
//    ///
//    static func diag<T: Numeric>(_ v: [T], _ k: Int) -> Matrix<T> {
//        let size = v.count + abs(k)
//        let m = Matrix<T>(size, size)
//        for i in 0..<v.count {
//            print(m[0].values)
//            m[i, i] = v[i]
//        }
//        return m
//    }
}
