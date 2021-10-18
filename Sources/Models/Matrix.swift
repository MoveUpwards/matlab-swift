//
//  Matrix.swift
//  
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

public final class Matrix<Element: Numeric> {
    public var dimensions: [Int] // Like [2, 3, 4]
    public var subMatrices: [Matrix] // Like [Matrix<3x4>, Matrix<3x4>]
    // If subMatrices is an empty array, the matrix is 1xN and stores directly values
    public var values: [Element]

    public init(value: Element = .zero, _ dim: [Int]) {
        guard !dim.isEmpty, dim.first(where: { $0 <= 0 }) == nil else { // Special case for empty matrix
            dimensions = [0, 0]
            subMatrices = []
            values = []
            return
        }

        dimensions = dim
        if dimensions.count == 1 { dimensions.insert(1, at: 0) } // Special case for 1xN matrix
        if dimensions.count == 2 {
            guard dimensions[0] > 1 else { // Special case for 1xN matrix, store in values
                subMatrices = []
                values = [Element](repeating: value, count: dimensions[1])
                return
            }
        }

        // Never use array(reapeting) on class as it will share the same object
        subMatrices = (0..<dimensions[0]).map { [dimensions] _ in Matrix(value: value, Array(dimensions.dropFirst())) }
        values = []
    }

    public convenience init(value: Element = .zero, _ dimensions: Int...) {
        self.init(value: value, Array(dimensions))
    }

    public convenience init(row: [Element]) {
        self.init(1, row.count)
        values = row
    }

    public convenience init(column: [Element]) {
        self.init(column.count, 1)
        for i in 0..<column.count {
            self[i, 0] = column[i]
        }
    }

    public convenience init(array: [[Element]]) { // TODO: Check if valid 2D array for a matrix
        let size = array.count
        self.init(size, array[0].count)
        guard size > 1 else {
            values = array[0]
            return
        }
        for i in 0..<size {
            subMatrices[i].values = array[i]
        }
    }
}

// MARK: - Columns & Rows

public extension Matrix {
    internal var rowsCount: Int { dimensions[0] }
    internal var columnsCount: Int { dimensions[1] }

    func rows(at start: Int, to end: Int? = nil) -> Matrix<Element> {
        guard start >= 0, (end ?? 0) >= 0 else { return Matrix<Element>() }
        guard let end = end else { return subMatrices[start] }
        guard start != end else { return subMatrices[start] }
        guard end > start else { return Matrix<Element>() }

        let m = Matrix<Element>(end-start+1, dimensions[1])
        m.subMatrices.removeAll()
        for i in start...end {
            m.subMatrices.append(subMatrices[i])
        }

        return m
    }

    func columns(at start: Int, to end: Int? = nil) -> Matrix<Element> {
        guard start >= 0, (end ?? 0) >= 0 else { return Matrix<Element>() }
        let end = (end ?? start)
        guard end >= start else { return Matrix<Element>() }

        let m = Matrix<Element>(subMatrices.count, end-start+1)
        for i in 0..<m.rowsCount {
            for j in 0..<m.columnsCount {
                m[i, j] = self[i, start+j]
            }
        }
        return m
    }
}

// MARK: - Copying

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
        guard dimensions != [0, 0] else { return swiftDescription + "\n" + "Empty Matrix" }
        guard dimensions[0] != 1 else { return swiftDescription + "\n" + values.description }
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
            guard dimensions != [0, 0] else { return .zero } // Special case for empty matric
            precondition(subMatrixIndex >= 0 && valueIndex >= 0)
            if dimensions[0] == 1 {
                return values[valueIndex]
            } else {
                return subMatrices[subMatrixIndex].values[valueIndex]
            }
        }
        set {
            guard dimensions != [0, 0] else { return } // Special case for empty matric
            precondition(subMatrixIndex >= 0 && valueIndex >= 0)
            if dimensions.count == 2, dimensions[0] == 1 {
                values[valueIndex] = newValue
            } else {
                subMatrices[subMatrixIndex].values[valueIndex] = newValue
            }
        }
    }
}

// MARK: - Mathematic's operations

extension Matrix: Equatable {
    public static func == (lhs: Matrix<Element>, rhs: Matrix<Element>) -> Bool {
        guard lhs.dimensions == rhs.dimensions else { return false }
        guard !lhs.subMatrices.isEmpty else {
            return lhs.values == rhs.values
        }
        return lhs.subMatrices == rhs.subMatrices
    }
}
