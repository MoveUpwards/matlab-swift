//
//  Matrix.swift
//  
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

public struct Matrix<Element: Numeric> {
    public var dimensions: [Int] // Like [2, 3, 4]
    public var subMatrices: [Matrix] // Like [Matrix<3x4>, Matrix<3x4>]
    // If subMatrices is an empty array, the matrix is 1xN and stores directly values
    public var values: Vector<Element>

    public init(value: Element = .zero, _ dim: [Int]) {
        guard !dim.isEmpty, dim.first(where: { $0 <= 0 }) == nil else { // Special case for empty matrix
            dimensions = [0, 0]
            subMatrices = []
            values = Vector([])
            return
        }

        dimensions = dim
        if dimensions.count == 1 { dimensions.insert(1, at: 0) } // Special case for 1xN matrix
        if dimensions.count == 2 {
            guard dimensions[0] > 1 else { // Special case for 1xN matrix, store in values
                subMatrices = []
                values = Vector(repeating: value, count: dimensions[1])
                return
            }
        }

        // Never use array(reapeting) on class as it will share the same object
        subMatrices = (0..<dimensions[0]).map { [dimensions] _ in Matrix(value: value, Array(dimensions.dropFirst())) }
        values = Vector([])
    }

    public init(value: Element = .zero, _ dimensions: Int...) {
        self.init(value: value, Array(dimensions))
    }

    public init(row: Array<Element>) { self.init(row: Vector(row)) }
    public init(row: Vector<Element>) {
        self.init(1, row.count)
        values = row
    }

    public init(column: Array<Element>) { self.init(column: Vector(column)) }
    public init(column: Vector<Element>) {
        self.init(column.count, 1)
        (0..<column.count).forEach { self[$0, 0] = column[$0] }
    }

    public init(array: [[Element]]) { // TODO: Check if valid 2D array for a matrix
        let size = array.count
        self.init(size, array[0].count)
        guard size > 1 else {
            values = Vector(array[0])
            return
        }
        (0..<size).forEach { subMatrices[$0].values = Vector(array[$0]) }
    }

    public var asDouble: Matrix<Double> {
        var matrix = Matrix<Double>(dimensions)
        matrix.allValues = Vector(allValues.map { Double($0) })
        return matrix
    }
}

// MARK: - Private Helpers

internal extension Matrix {
    var rowsCount: Int { dimensions[0] }
    var columnsCount: Int { dimensions[1] }
    var is2dMatrix: Bool { dimensions.count == 2 }

    func checkRow(_ index: Int) {
        precondition(index >= 0 && index < rowsCount, "Row index out of bounds")
    }

    func checkColumn(_ index: Int) {
        precondition(index >= 0 && index < columnsCount, "Column index out of bounds")
    }
}

// MARK: - Public Helpers

public extension Matrix {
    var rows: [[Element]] {
        precondition(is2dMatrix)
        guard dimensions[0] > 0 else { return [[]] }
        guard dimensions[0] > 1 else { return [Array(values)] }
        var array = [[Element]]()
        (0..<dimensions[0]).forEach { array.append(Array(subMatrices[$0].values)) }
        return array
    }

    var columns: [[Element]] {
        precondition(is2dMatrix)
        guard dimensions[0] > 0 else { return [[]] }
        var array = [[Element]]()
        guard dimensions[0] > 1 else {
            (0..<dimensions[1]).forEach { i in array.append([values[i]]) }
            return array
        }
        (0..<dimensions[1]).forEach { i in array.append(subMatrices.map { subMat in subMat.values[i] }) }
        return array
    }
}

// MARK: - Columns & Rows

public extension Matrix {
    func rows(at start: Int, to end: Int? = nil) -> Self {
        guard start >= 0, (end ?? 0) >= 0 else { return Self() }
        guard let end = end else { return subMatrices[start] }
        guard start != end else { return subMatrices[start] }
        guard end > start else { return Self() }

        var m = Self(end-start+1, dimensions[1])
        m.subMatrices.removeAll()
        for i in start...end {
            m.subMatrices.append(subMatrices[i])
        }

        return m
    }

    func columns(at start: Int, to end: Int? = nil) -> Self {
        guard start >= 0, (end ?? 0) >= 0 else { return Self() }
        let end = (end ?? start)
        guard end >= start else { return Self() }

        var m = Self(subMatrices.count, end-start+1)
        for i in 0..<m.rowsCount {
            for j in 0..<m.columnsCount {
                m[i, j] = self[i, start+j]
            }
        }
        return m
    }

    // Mutating functions for 2D matrix

    /// Fill the selected row at index with a repeated value.
    mutating func fillRow(_ index: Int, value: Element) {
        precondition(is2dMatrix)
        checkRow(index)
        subMatrices[index].values = Vector([Element](repeating: value, count: columnsCount))
    }

    /// Fill the selected column at index with a repeated value.
    mutating func fillColumn(_ index: Int, value: Element) {
        precondition(is2dMatrix)
        checkColumn(index)
        (0..<rowsCount).forEach { subMatrices[$0].values[index] = value }
    }

    /// Insert a new row at selected index and fill it with a repeated value.
    @discardableResult
    mutating func insertRow(_ index: Int, value: Element) -> Self {
        precondition(is2dMatrix)
        checkRow(index)
        dimensions[0] += 1
        subMatrices.insert(Matrix(value: value, [1, columnsCount]), at: index)
        return self
    }

    /// Insert a new column at selected index and fill it with a repeated value.
    @discardableResult
    mutating func insertColumn(_ index: Int, value: Element) -> Self {
        precondition(is2dMatrix)
        checkColumn(index)
        dimensions[1] += 1
        (0..<rowsCount).forEach { subMatrices[$0].values.insert(value, at: index) }
        return self
    }

    /// Remove the row at selected index.
    @discardableResult
    mutating func removeRow(_ index: Int) -> Self {
        precondition(is2dMatrix)
        checkRow(index)
        dimensions[0] -= 1
        guard dimensions[0] > 0 else { // Transform to Empty Matrix
            dimensions = [0, 0]
            subMatrices = []
            values = Vector([])
            return self
        }
        subMatrices.remove(at: index)
        if dimensions[0] == 1 { // If rows count become 1, we move values from the submatrix to his value
            values = subMatrices[0].values
            subMatrices.removeAll()
        }
        return self
    }

    /// Remove the column at selected index.
    @discardableResult
    mutating func removeColumn(_ index: Int) -> Self {
        precondition(is2dMatrix)
        checkColumn(index)
        dimensions[1] -= 1
        guard dimensions[0] > 1 else {
            _ = values.remove(at: index)
            return self
        }
        (0..<rowsCount).forEach {
            subMatrices[$0].removeColumn(index)
        }
        return self
    }
}

// MARK: - Complex operations

public extension Matrix {
    /// Flips the matrix over its diagonal.
    var transpose: Self {
        precondition(is2dMatrix)
        return Self(array: columns)
    }

    var inverse: Matrix<Double> {
        precondition(is2dMatrix && dimensions[0] == dimensions[1])
        return cofactor.transpose.asDouble * (.one / asDouble.determinant)
    }

    var determinant: Element {
        guard rowsCount == columnsCount else { return .zero } // No determinant for non-square matrix
        guard rowsCount > 0 else { return .zero } // No determinant for empty matrix
        guard rowsCount > 1 else { return self[0, 0] }

        var sum = Element.zero
        var multiplier = Element.one
        let topRow = rows(at: 0)

        for (column, num) in topRow.values.enumerated() {
            var subMatrix = self
            subMatrix.removeRow(0)
            subMatrix.removeColumn(column)
            sum += num * multiplier * subMatrix.determinant // Recursive call
            multiplier *= -.one
        }

        return sum
    }

    var cofactor: Self {
        return map { row, col, _ in
            var subMatrix = self
            subMatrix.removeRow(row)
            subMatrix.removeColumn(col)

            return subMatrix.determinant * ((row+col) % 2 == 0 ? .one : -.one)
        }
    }

    var trace: Element {
        let n = min(rowsCount, columnsCount)
        var sum = Element.zero
        for i in 0..<n {
            sum += self[i, i]
        }
        return sum
    }

    func dot(_ matrix: Self) -> Self {
        precondition(columnsCount == matrix.rowsCount, "Incombatible dimensions for dot function")
        var result = Self(rowsCount, matrix.columnsCount)

        for row in 0..<rowsCount {
            for col in 0..<matrix.columnsCount {
                for i in 0..<columnsCount {
                    result[row, col] += self[row, i] * matrix[i, col]
                }
            }
        }

        return result
    }

    func divide(_ matrix: Self) -> Matrix<Double> { self / matrix }
}

// MARK: - Description

//extension Matrix: CustomStringConvertible {
//    public var description: String {
//        var swiftDescription = "<\(type(of: self)): \(/*Unmanaged.passUnretained(self).toOpaque()*/0)>"
//        swiftDescription += "\n<Dimensions: " + dimensions.description + ">"
//        guard dimensions.count < 3 else { return swiftDescription }
//        guard dimensions != [0, 0] else { return swiftDescription + "\n" + "Empty Matrix" }
//        guard dimensions[0] != 1 else { return swiftDescription + "\n" + values.description }
//        for i in 0..<subMatrices.count {
//            swiftDescription += "\n" + subMatrices[i].values.description
//        }
//        return swiftDescription
//    }
//}

// MARK: - All values

public extension Matrix {
    internal var valuesCount: Int { dimensions.reduce(1, *) }

    internal var allValues: Vector<Element> {
        get {
            guard !subMatrices.isEmpty else { return values }
            return subMatrices.compactMap { $0.allValues }.reduce(Vector([])) { $0.concat($1) }
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
            (0..<splitValues.count).forEach { subMatrices[$0].allValues = splitValues[$0] }
        }
    }

    // Same as allValues but following columns
    internal var allColumnsValues: Vector<Element> {
        get {
            return Vector(columns.flatMap { $0 }) // TODO: Do not use columns to allow 3D+ matrix
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
            var counter = 0
            (0..<dimensions[1]).forEach { j in
                (0..<dimensions[0]).forEach { i in
                    self[i, j] = newValue[counter]
                    counter += 1
                }
            }
        }
    }
}

// MARK: - Map transform

public extension Matrix {
    func map(_ transform: (_ row: Int, _ col: Int, _ value: Element) -> Element) -> Self {
        var mapped = self
        for i in 0..<rowsCount {
            for j in 0..<columnsCount {
                mapped[i, j] = transform(i, j, self[i, j])
            }
        }
        return mapped
    }
}

// MARK: - Subsript

public extension Matrix {
    subscript(subMatrixIndex: Int) -> Matrix {
        get {
            checkRow(subMatrixIndex)
            return subMatrices[subMatrixIndex]
        }
        set {
            checkRow(subMatrixIndex)
            subMatrices[subMatrixIndex] = newValue
        }
    }

    /// get is a subscript with throwable error instead of precodition
    func getRow(_ at: Int...) throws -> Matrix {
        guard !at.isEmpty else { throw MatrixError.invalidIndex }
        guard !at.contains(0) else { throw MatrixError.outOfBounds }
        guard at[0] < subMatrices.count else { throw MatrixError.outOfBounds }
        return subMatrices[at[0]]
    }

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
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.dimensions == rhs.dimensions else { return false }
        guard !lhs.subMatrices.isEmpty else {
            return lhs.values == rhs.values
        }
        return lhs.subMatrices == rhs.subMatrices
    }
}

infix operator ⋅ : MultiplicationPrecedence
infix operator ⊗ : MultiplicationPrecedence

public extension Matrix {
    // MARK: - Operations Matrix - Matrix

    static func + (lhs: Self, rhs: Self) -> Self {
        precondition(lhs.dimensions == rhs.dimensions)
        var newValue = lhs
        newValue.allValues += rhs.allValues
        return newValue
    }

    static func - (lhs: Self, rhs: Self) -> Self {
        precondition(lhs.dimensions == rhs.dimensions)
        var newValue = lhs
        newValue.allValues -= rhs.allValues
        return newValue
    }

    static func * (lhs: Self, rhs: Self) -> Self { lhs.dot(rhs) }

    static func / (lhs: Self, rhs: Self) -> Matrix<Double> {
        precondition(lhs.is2dMatrix && rhs.is2dMatrix) // For the moment, only allowed on 2D matrix
        precondition(lhs.dimensions[1] == rhs.dimensions[0])
        return lhs.asDouble.dot(rhs.inverse)
    }

    static func ⋅ (lhs: Self, rhs: Self) -> Self { lhs.dot(rhs) }

    // Kronecker product
    static func ⊗ (lhs: Self, rhs: Self) -> Self {
        precondition(lhs.rowsCount > 0)
        var matrix = MatLab.horzcat((0..<lhs.columnsCount).map { lhs[0, $0] * rhs })
        for i in 1..<lhs.rowsCount {
            matrix = MatLab.vertcat(matrix, MatLab.horzcat((0..<lhs.columnsCount).map { lhs[i, $0] * rhs }))
        }
        return matrix
    }

    // MARK: - Operations Matrix - Scalar

    static func += (lhs: inout Self, rhs: Element) { lhs = lhs + rhs }
    static func + (lhs: Element, rhs: Self) -> Self { rhs + lhs }
    static func + (lhs: Self, rhs: Element) -> Self {
        var newValue = lhs
        newValue.allValues += rhs
        return newValue
    }

    static func -= (lhs: inout Self, rhs: Element) { lhs = lhs - rhs }
    static func - (lhs: Element, rhs: Self) -> Self {
        var newValue = rhs
        newValue.allValues = lhs - newValue.allValues
        return newValue
    }
    static func - (lhs: Self, rhs: Element) -> Self {
        var newValue = lhs
        newValue.allValues -= rhs
        return newValue
    }

    static func *= (lhs: inout Self, rhs: Element) { lhs = lhs * rhs }
    static func * (lhs: Element, rhs: Self) -> Self { rhs * lhs }
    static func * (lhs: Self, rhs: Element) -> Self {
        var newValue = lhs
        newValue.allValues *= rhs
        return newValue
    }

    static func /= (lhs: inout Self, rhs: Element) { lhs = lhs / rhs }
    static func / (lhs: Element, rhs: Self) -> Self {
        var newValue = rhs
        newValue.allValues = lhs / newValue.allValues
        return newValue
    }
    static func / (lhs: Self, rhs: Element) -> Self {
        var newValue = lhs
        newValue.allValues /= rhs
        return newValue
    }
}
