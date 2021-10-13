//
//  MatLab+squeeze.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension Matrix {
    internal var valuesCount: Int { dimensions.reduce(1, *) }

    internal func getAllValues() -> [Element] {
        guard !subMatrices.isEmpty else { return values }
        return subMatrices.flatMap { $0.getAllValues() }
    }

    internal func set(allValues: [Element]) {
        let count = allValues.count
        guard count == dimensions.reduce(1, *) else { return }
        guard !subMatrices.isEmpty else {
            if count == valuesCount {
                values = allValues
            }
            return
        }
        let splitValues = allValues.chunked(into: count / subMatrices.count)
        for i in 0..<splitValues.count {
            subMatrices[i].set(allValues: splitValues[i])
        }
    }
}

public extension MatLab {
    ///
    /// squeeze(a) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/squeeze.html)
    ///
    /// - Parameters:
    ///     - a: Input multidimensional array.
    ///
    /// - Returns:
    ///     Returns a matrix with the same elements as the input array A, but with dimensions of length 1 removed..
    ///
    static func squeeze<T: Numeric>(_ a: Matrix<T>) -> Matrix<T> {
        guard !a.dimensions.isEmpty,
              !a.subMatrices.isEmpty,
              a.dimensions.first(where: { $0 <= 1 }) != nil else { return a.copy() }

        let new = Matrix<T>(a.dimensions.filter { $0 > 1 })
        let allValues = a.getAllValues()
        new.set(allValues: allValues)
        return new
    }
}
