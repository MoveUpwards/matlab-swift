//
//  Matrix.swift
//  
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

public final class Matrix<Element: Numeric> {
    public var dimensions: [Int] // Like [2, 3, 4]
    public var subMatrices: [Matrix] // Like [Matrix<3x4>, Matrix<3x4>]
    // If subMatrices is an empty array, the matrix is 1D and stores directly values
    public var values: [Element]

    public init(value: Element = .zero, _ dim: [Int]) {
        guard !dim.isEmpty, dim.first(where: { $0 <= 0 }) == nil else {
            dimensions = [0]
            subMatrices = []
            values = []
            return
        }

        dimensions = dim
        guard dimensions.count > 1 else {
            subMatrices = []
            values = [Element](repeating: value, count: dimensions[0])
            return
        }

        // Never use array(reapeting) on class as it will share the same object
        subMatrices = (0..<dimensions[0]).map { [dimensions] _ in Matrix(value: value, Array(dimensions.dropFirst())) }
        values = []
    }

    public convenience init(value: Element = .zero, _ dimensions: Int...) {
        self.init(value: value, Array(dimensions))
    }

    public convenience init(array: [Element]) { // Should we make 1xarray.count or single array?
        self.init(array.count)
        values = array
    }

    public convenience init(array: [[Element]]) { // TODO: Check if valid 2D array for a matrix
        let size = array.count
        self.init(size, array[0].count)
        for i in 0..<size {
            subMatrices[i].values = array[i]
        }
    }
}

extension Matrix: Copying {
    public func copy() -> Self {
        let new = Self(dimensions)
        guard !subMatrices.isEmpty else {
            new.values = values
            return new
        }
        for x in 0..<new.subMatrices.count {
            new.subMatrices[x] = subMatrices[x].copy()
        }
        return new
    }
}

// MARK: - Description

extension Matrix: CustomStringConvertible {
    public var description: String {
        var swiftDescription = "<\(type(of: self)): \(Unmanaged.passUnretained(self).toOpaque())>"
        swiftDescription += "\n<Dimensions: " + dimensions.description + ">"
        guard dimensions.count < 3 else { return swiftDescription }
        guard dimensions.count > 1 else { return swiftDescription + "\n" + values.description }
        for i in 0..<subMatrices.count {
            swiftDescription += "\n" + subMatrices[i].values.description
        }
        return swiftDescription
    }
}

// MARK: - All values

public extension Matrix {
    internal var valuesCount: Int { dimensions.reduce(1, *) }

    internal var allValues: [Element] {
        get {
            guard !subMatrices.isEmpty else { return values }
            return subMatrices.flatMap { $0.allValues }
        }
        set {
            let count = newValue.count
            guard count == dimensions.reduce(1, *) else { return }
            guard !subMatrices.isEmpty else {
                if count == valuesCount {
                    values = newValue
                }
                return
            }
            let splitValues = newValue.chunked(into: count / subMatrices.count)
            for i in 0..<splitValues.count {
                subMatrices[i].allValues = splitValues[i]
            }
        }
    }
}

// MARK: - Subsript

public extension Matrix {
    subscript(subMatrixIndex: Int) -> Matrix {
        get {
            precondition(subMatrixIndex >= 0)
            guard subMatrixIndex < subMatrices.count else { return self }
            return subMatrices[subMatrixIndex]
        }
        set {
            precondition(subMatrixIndex >= 0 && subMatrixIndex < subMatrices.count)
            subMatrices[subMatrixIndex] = newValue
        }
    }

//    func get(_ at: Int...) throws -> Matrix {
//        guard !at.isEmpty, at[0] >= 0 else { throw MatrixError.invalidIndex }
//        guard at[0] < subMatrices.count else { throw MatrixError.outOfBounds }
//        return subMatrices[at[0]]
//    }

    subscript(subMatrixIndex: Int, valueIndex: Int) -> Element {
        get {
            precondition(subMatrixIndex >= 0)
//            guard subMatrixIndex < subMatrices.count else { return .zero } // Fallback for empty matrix
            precondition(valueIndex >= 0 && valueIndex < subMatrices[subMatrixIndex].values.count)
            return subMatrices[subMatrixIndex].values[valueIndex]
        }
        set {
            precondition(subMatrixIndex >= 0 && subMatrixIndex < subMatrices.count)
            precondition(valueIndex >= 0 && valueIndex < subMatrices[subMatrixIndex].values.count)
            subMatrices[subMatrixIndex].values[valueIndex] = newValue
        }
    }
}

// MARK: - Mathematic's operations

extension Matrix: Equatable {
    public static func == (lhs: Matrix<Element>, rhs: Matrix<Element>) -> Bool {
        guard lhs.dimensions == rhs.dimensions else { return false }
        guard !lhs.subMatrices.isEmpty else { return lhs.values == rhs.values }
        print("Array Equatable of", lhs.subMatrices, "and", rhs.subMatrices)
        return lhs.subMatrices == rhs.subMatrices
    }
}
