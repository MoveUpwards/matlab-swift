//
//  MatLab+svd.swift
//  
//
//  Created by Damien Noël Dubuisson on 02/11/2021.
//

public extension MatLab {
    ///
    /// svd(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/svd.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///
    /// - Returns:
    ///     Returns the singular values of matrix A in descending order.
    ///
    static func svd<T: Numeric>(_ a: Matrix<T>) -> [Double] {
        return svd(a).s
    }

    ///
    /// svd(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/svd.html)
    ///
    /// - Parameters:
    ///     - a: Input matrix.
    ///
    /// - Returns:
    ///     Performs a singular value decomposition of matrix A, such that A = U*S*V'.
    ///     U - Left singular vectors.
    ///     S - Singular values.
    ///     V - Right singular vectors.
    ///
    static func svd<T: Numeric>(_ a: Matrix<T>) -> (u: Matrix<Double>, s: [Double], v: Matrix<Double>) {
        let aDouble = a.asDouble
        let rowsCount = aDouble.rowsCount
        let columnsCount = aDouble.columnsCount

        var vector = [Double](repeating: .zero, count: a.rowsCount) // S as vector
        for i in 0..<rowsCount {
            var combinedRow = 0.0
            for j in 0..<columnsCount {
                combinedRow += aDouble[i, j] * aDouble[i, j]
            }
            vector[i] = combinedRow
        }

        var (u, s, v) = aDouble.rotated(by: vector)

        // Update Matrix S member values
        for i in 0..<rowsCount {
            var combinedRow = 0.0
            for j in 0..<columnsCount {
                combinedRow += u[i, j] * u[i, j]
            }
            s[i] = combinedRow.squareRoot()
        }

        // Sort members of Matrix S and V
        for iFirst in 0..<(rowsCount-1) {
            for iSecond in (iFirst+1)..<rowsCount {
                let val1 = s[iFirst]
                let val2 = s[iSecond]
                
                if val1 < val2 {
                    s[iFirst] = val2
                    s[iSecond] = val1

                    for j in 0..<columnsCount {
                        u.swapValue(first: (iFirst, j), second: (iSecond, j))
                        v.swapValue(first: (iFirst, j), second: (iSecond, j))
                    }
                }
            }
        }

        // factor(matrixA, matrixW)
        u.factor(with: s)

        return (u, s, v) // diag(s) if matrix
    }
}
