//
//  MatLab+squeeze.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

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

    static func squeeze_old<T: Numeric>(_ a: Matrix<T>) -> Matrix<T> {
        guard a.dimensions.contains(1) else { return a }

        let new = Matrix<T>(a.dimensions.filter { $0 > 1 })

        guard !a.subMatrices.isEmpty else {
            new.values = a.values
            return new
        }
        guard a.subMatrices.count != new.subMatrices.count else {
            for x in 0..<new.subMatrices.count {
                new.subMatrices[x] = squeeze(a.subMatrices[x])//.copy()
            }
            return new
        }
//        new = a.subMatrices[0]
        return a.subMatrices[0]

//        return new
    }
/*
    static func squeez<T: Numeric>(_ a: Matrix<T>) -> Matrix<T> {
        guard !a.dimensions.isEmpty else { return a }
        guard !a.subMatrices.isEmpty else { return Matrix(array: a.values) }
        let start = a.dimensions[0] == 1 ? 1 : 0
        let new = Matrix<T>(Array(a.dimensions[start...]))
        new.subMatrices = (a.dimensions[0] == 1 ? a.subMatrices[0].subMatrices : a.subMatrices).map { squeez($0) }
        return new
    }
*/
/*
    static func squeeze2<T: Numeric>(_ a: Matrix<T>) -> Matrix<T> {
        guard !a.dimensions.isEmpty, !a.subMatrices.isEmpty else { return a }

        let dim = a.dimensions.filter { $0 > 1 }
//        guard !dim.isEmpty else {
//            let m = Matrix([1])
//            m[0] = T(1)
//            return a
//        }
        let matrix = Matrix<T>()
        return matrix


        //---------------------

        guard a.dimensions[0] == 1 else {
            a.subMatrices = a.subMatrices.map { squeeze2($0) }
            return a
        }

        let new = Matrix<T>(Array(a.dimensions[1...]))
        guard a.subMatrices.count != new.subMatrices.count else {
            for x in 0..<new.subMatrices.count {
                new.subMatrices[x] = squeeze2(a.subMatrices[x])//.copy()
            }
            return new
        }
//        new = a.subMatrices[0]
        return a.subMatrices[0]

//        return new
    }*/
}
