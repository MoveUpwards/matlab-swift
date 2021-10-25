//
//  Vector.swift
//  
//
//  Created by Damien Noël Dubuisson on 19/10/2021.
//

@frozen public struct Vector<Element> where Element: Numeric {
    public var datas: [Element]

    /// Creates a new collection containing the specified number of a single, repeated value.
    ///
    /// Here's an example of creating an array initialized with five strings containing the letter *Z*.
    ///
    ///     let fiveZs = Array(repeating: "Z", count: 5)
    ///     print(fiveZs)
    ///     // Prints "["Z", "Z", "Z", "Z", "Z"]"
    ///
    /// - Parameters:
    ///   - repeatedValue: The element to repeat.
    ///   - count: The number of times to repeat the value passed in the `repeating` parameter. `count` must be zero or greater.
    ///
    @inlinable public init(repeating repeatedValue: Element, count: Int) {
        datas = [Element](repeating: repeatedValue, count: count)
    }

    /// Creates a new instance of a collection containing the elements of a sequence.
    ///
    /// - Parameter elements: The sequence of elements for the new collection.
    ///
    @inlinable public init(_ elements: [Element]) { datas = elements }

    /// Creates a new instance of a collection containing the elements of a sequence.
    ///
    /// - Parameter elements: The sequence of elements for the new collection.
    ///
    @inlinable public init(_ elements: ArraySlice<Element>) { datas = Array(elements) }

    /// Adds an element to the end of the collection.
    ///
    /// If the collection does not have sufficient capacity for another element, additional storage is allocated before appending `newElement`. The
    /// following example adds a new number to an array of integers:
    ///
    ///     var numbers = [1, 2, 3, 4, 5]
    ///     numbers.append(100)
    ///
    ///     print(numbers)
    ///     // Prints "[1, 2, 3, 4, 5, 100]"
    ///
    /// - Parameter newElement: The element to append to the collection.
    ///
    /// - Complexity: O(1) on average, over many calls to `append(_:)` on the
    ///   same collection.
    ///
    @inlinable public mutating func append(_ newElement: Element) { datas.append(newElement) }

    /// Adds the elements of a sequence or collection to the end of this collection.
    ///
    /// The collection being appended to allocates any additional necessary storage to hold the new elements.
    ///
    /// The following example appends the elements of a `Range<Int>` instance to an array of integers:
    ///
    ///     var numbers = [1, 2, 3, 4, 5]
    ///     numbers.append(contentsOf: 10...15)
    ///     print(numbers)
    ///     // Prints "[1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15]"
    ///
    /// - Parameter newElements: The elements to append to the collection.
    ///
    /// - Complexity: O(*m*), where *m* is the length of `newElements`.
    ///
    @inlinable public mutating func append(contentsOf newElements: Self) { datas.append(contentsOf: newElements.datas) }

    /// Removes and returns the element at the specified position.
    ///
    /// All the elements following the specified position are moved up to close the gap.
    ///
    ///     var measurements: [Double] = [1.1, 1.5, 2.9, 1.2, 1.5, 1.3, 1.2]
    ///     let removed = measurements.remove(at: 2)
    ///     print(measurements)
    ///     // Prints "[1.1, 1.5, 1.2, 1.5, 1.3, 1.2]"
    ///
    /// - Parameter index: The position of the element to remove. `index` must be a valid index of the array.
    /// - Returns: The element at the specified index.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the array.
    /// 
    @inlinable public mutating func remove(at index: Int) -> Element { datas.remove(at: index) }

    /// Inserts a new element at the specified position.
    ///
    /// The new element is inserted before the element currently at the specified index. If you pass the array's `endIndex` property as the `index`
    /// parameter, the new element is appended to the array.
    ///
    ///     var numbers = [1, 2, 3, 4, 5]
    ///     numbers.insert(100, at: 3)
    ///     numbers.insert(200, at: numbers.endIndex)
    ///
    ///     print(numbers)
    ///     // Prints "[1, 2, 3, 100, 4, 5, 200]"
    ///
    /// - Parameter newElement: The new element to insert into the array.
    /// - Parameter i: The position at which to insert the new element. `index` must be a valid index of the array or equal to its `endIndex`
    ///   property.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the array. If `i == endIndex`, this method is equivalent to `append(_:)`.
    ///
    @inlinable public mutating func insert(_ newElement: Element, at i: Int) { datas.insert(newElement, at: i) }

    /// Return a Vector with both Vector concatened.
    ///
    /// - Parameter newElements: The elements to append to the collection.
    ///
    /// - Complexity: O(*m*), where *m* is the length of `newElements`.
    ///
    @inlinable public func concat(_ newElements: Self) -> Self { Self(datas + newElements.datas) }

    /// A Boolean value indicating whether the collection is empty.
    ///
    /// When you need to check whether your collection is empty, use the `isEmpty` property instead of checking that the `count` property is
    /// equal to zero. For collections that don't conform to `RandomAccessCollection`, accessing the `count` property iterates
    /// through the elements of the collection.
    ///
    ///     let horseName = "Silver"
    ///     if horseName.isEmpty {
    ///         print("My horse has no name.")
    ///     } else {
    ///         print("Hi ho, \(horseName)!")
    ///     }
    ///     // Prints "Hi ho, Silver!")
    ///
    /// - Complexity: O(1)
    ///
    @inlinable public var isEmpty: Bool { datas.isEmpty }

    /// The number of elements in the collection.
    ///
    /// To check whether a collection is empty, use its `isEmpty` property instead of comparing `count` to zero. Unless the collection guarantees
    /// random-access performance, calculating `count` can be an O(*n*) operation.
    ///
    /// - Complexity: O(1) if the collection conforms to
    ///   `RandomAccessCollection`; otherwise, O(*n*), where *n* is the length
    ///   of the collection.
    ///
    @inlinable public var count: Int { datas.count }

    // #############################
//    @inlinable public subscript<R>(r: R) -> ArraySlice<Element> where R : RangeExpression, Int == R.Bound { get }
//
//    @inlinable public subscript(x: (UnboundedRange_) -> ()) -> ArraySlice<Element> { get }
//
//    @inlinable public subscript<R>(r: R) -> ArraySlice<Element> where R : RangeExpression, Int == R.Bound
//
//    @inlinable public subscript(x: (UnboundedRange_) -> ()) -> ArraySlice<Element>
}

extension Vector {
    ///
    /// Convert 1D array to 2D array with subArrays of size.
    ///
    /// - Parameters:
    ///   - size: Maximum size of chunked array. Last element can be smaller.
    public func chunked(into size: Int) -> [Self] {
        return stride(from: 0, to: count, by: size).map {
            self[$0 ..< Swift.min($0 + size, count)]
        }
    }
}

extension Vector: Sequence {
    /// Returns an iterator over the elements of this sequence.
    public func makeIterator() -> AnyIterator<Element> { AnyIterator(datas.makeIterator()) }
}

extension Vector {
    /// Accesses the element at the specified position.
    ///
    /// The following example uses indexed subscripting to update an array's second element. After assigning the new value (`"Butler"`) at a specific
    /// position, that value is immediately available at that same position.
    ///
    ///     var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     streets[1] = "Butler"
    ///     print(streets[1])
    ///     // Prints "Butler"
    ///
    /// - Parameter index: The position of the element to access. `index` must be greater than or equal to `startIndex` and less than `endIndex`.
    ///
    /// - Complexity: Reading an element from an array is O(1). Writing is O(1) unless the array's storage is shared with another array or uses a
    ///   bridged `NSArray` instance as its storage, in which case writing is O(*n*), where *n* is the length of the array.
    ///
    @inlinable public subscript(index: Int) -> Element {
        get {
            return datas[index]
        }
        set {
            datas[index] = newValue
        }
    }

    /// Accesses a contiguous subrange of the array's elements.
    ///
    /// The returned `ArraySlice` instance uses the same indices for the same elements as the original array. In particular, that slice, unlike an
    /// array, may have a nonzero `startIndex` and an `endIndex` that is not equal to `count`. Always use the slice's `startIndex` and `endIndex`
    /// properties instead of assuming that its indices start or end at a particular value.
    ///
    /// This example demonstrates getting a slice of an array of strings, finding the index of one of the strings in the slice, and then using that index
    /// in the original array.
    ///
    ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     let streetsSlice = streets[2 ..< streets.endIndex]
    ///     print(streetsSlice)
    ///     // Prints "["Channing", "Douglas", "Evarts"]"
    ///
    ///     let i = streetsSlice.firstIndex(of: "Evarts")    // 4
    ///     print(streets[i!])
    ///     // Prints "Evarts"
    ///
    /// - Parameter bounds: A range of integers. The bounds of the range must be valid indices of the array.
    ///
    @inlinable public subscript(bounds: Range<Int>) -> Self { Self(datas[bounds]) }

    /// Accesses a contiguous subrange of the array's elements.
    ///
    /// The returned `ArraySlice` instance uses the same indices for the same elements as the original array. In particular, that slice, unlike an
    /// array, may have a nonzero `startIndex` and an `endIndex` that is not equal to `count`. Always use the slice's `startIndex` and `endIndex`
    /// properties instead of assuming that its indices start or end at a particular value.
    ///
    /// This example demonstrates getting a slice of an array of strings, finding the index of one of the strings in the slice, and then using that index
    /// in the original array.
    ///
    ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     let streetsSlice = streets[2 ..< streets.endIndex]
    ///     print(streetsSlice)
    ///     // Prints "["Channing", "Douglas", "Evarts"]"
    ///
    ///     let i = streetsSlice.firstIndex(of: "Evarts")    // 4
    ///     print(streets[i!])
    ///     // Prints "Evarts"
    ///
    /// - Parameter bounds: A range of integers. The bounds of the range must be valid indices of the array.
    ///
    @inlinable public subscript(bounds: ClosedRange<Int>) -> Self { Self(datas[bounds]) }

    /// Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.
    ///
    /// Use this method to receive a single-level collection when your transformation produces a sequence or collection for each element.
    ///
    /// In this example, note the difference in the result of using `map` and `flatMap` with a transformation that returns an array.
    ///
    ///     let numbers = [1, 2, 3, 4]
    ///
    ///     let mapped = numbers.map { Array(repeating: $0, count: $0) }
    ///     // [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]
    ///
    ///     let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) }
    ///     // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
    ///
    /// In fact, `s.flatMap(transform)`  is equivalent to `Array(s.map(transform).joined())`.
    ///
    /// - Parameter transform: A closure that accepts an element of this sequence as its argument and returns a sequence or collection.
    /// - Returns: The resulting flattened array.
    ///
    /// - Complexity: O(*m* + *n*), where *n* is the length of this sequence and *m* is the length of the result.
    ///
    @available(swift, deprecated: 4.1, renamed: "compactMap(_:)", message: "Please use compactMap(_:) for the case where closure returns an optional value")
    @inlinable public func flatMap<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        return try datas.flatMap(transform)
    }

    /// Returns an array containing the non-`nil` results of calling the given
    /// transformation with each element of this sequence.
    ///
    /// Use this method to receive an array of non-optional values when your
    /// transformation produces an optional value.
    ///
    /// In this example, note the difference in the result of using `map` and
    /// `compactMap` with a transformation that returns an optional `Int` value.
    ///
    ///     let possibleNumbers = ["1", "2", "three", "///4///", "5"]
    ///
    ///     let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
    ///     // [1, 2, nil, nil, 5]
    ///
    ///     let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
    ///     // [1, 2, 5]
    ///
    /// - Parameter transform: A closure that accepts an element of this
    ///   sequence as its argument and returns an optional value.
    /// - Returns: An array of the non-`nil` results of calling `transform`
    ///   with each element of the sequence.
    ///
    /// - Complexity: O(*m* + *n*), where *n* is the length of this sequence
    ///   and *m* is the length of the result.
    @inlinable public func compactMap<T>(_ transform: (Element) throws -> T?) rethrows -> [T] {
        return try datas.compactMap(transform)
    }

    /// Returns an array containing the results of mapping the given closure over the sequence's elements.
    ///
    /// In this example, `map` is used first to convert the names in the array to lowercase strings and then to count their characters.
    ///
    ///     let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    ///     let lowercaseNames = cast.map { $0.lowercased() }
    ///     // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
    ///     let letterCounts = cast.map { $0.count }
    ///     // 'letterCounts' == [6, 6, 3, 4]
    ///
    /// - Parameter transform: A mapping closure. `transform` accepts an element of this sequence as its parameter and returns a transformed
    ///   value of the same or of a different type.
    /// - Returns: An array containing the transformed elements of this sequence.
    ///
    @inlinable public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        return try datas.map(transform)
    }
}

extension Vector: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.count == rhs.count else { return false }
        for i in 0..<lhs.count {
            if let lValue = lhs[i] as? Nan, let rValue = rhs[i] as? Nan {
                guard lhs.datas[i] as? Double == rhs.datas[i] as? Double
                        || (lValue.isNaN && rValue.isNaN) else { return false }
            } else {
                guard lhs.datas[i] == rhs.datas[i] else { return false }
            }
        }
        return true
    }
}

extension Vector {
    public static func == (lhs: Array<Element>, rhs: Self) -> Bool { Self(lhs) == rhs }
    public static func == (lhs: Self, rhs: Array<Element>) -> Bool { lhs == Self(rhs) }
}

//extension Vector: CustomStringConvertible, CustomDebugStringConvertible {
//    /// A textual representation of the array and its elements.
//    public var description: String {
//        return "Vector"
//    }
//
//    /// A textual representation of the array and its elements, suitable for debugging.
//    public var debugDescription: String {
//        return "Vector"
//    }
//}
/*
extension Vector: RandomAccessCollection, MutableCollection {

    /// The index type for arrays, `Int`.
    ///
    /// `ArraySlice` instances are not always indexed from zero. Use `startIndex`
    /// and `endIndex` as the bounds for any element access, instead of `0` and
    /// `count`.
    public typealias Index = Int

    /// The type that represents the indices that are valid for subscripting an
    /// array, in ascending order.
    public typealias Indices = Range<Int>

    /// The type that allows iteration over an array's elements.
    public typealias Iterator = IndexingIterator<ArraySlice<Element>>

    /// The position of the first element in a nonempty array.
    ///
    /// `ArraySlice` instances are not always indexed from zero. Use `startIndex`
    /// and `endIndex` as the bounds for any element access, instead of `0` and
    /// `count`.
    ///
    /// If the array is empty, `startIndex` is equal to `endIndex`.
    @inlinable public var startIndex: Int { get }

    /// The array's "past the end" position---that is, the position one greater
    /// than the last valid subscript argument.
    ///
    /// When you need a range that includes the last element of an array, use the
    /// half-open range operator (`..<`) with `endIndex`. The `..<` operator
    /// creates a range that doesn't include the upper bound, so it's always
    /// safe to use with `endIndex`. For example:
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let i = numbers.firstIndex(of: 30) {
    ///         print(numbers[i ..< numbers.endIndex])
    ///     }
    ///     // Prints "[30, 40, 50]"
    ///
    /// If the array is empty, `endIndex` is equal to `startIndex`.
    @inlinable public var endIndex: Int { get }

    /// Returns the position immediately after the given index.
    ///
    /// - Parameter i: A valid index of the collection. `i` must be less than
    ///   `endIndex`.
    /// - Returns: The index immediately after `i`.
    @inlinable public func index(after i: Int) -> Int

    /// Replaces the given index with its successor.
    ///
    /// - Parameter i: A valid index of the collection. `i` must be less than
    ///   `endIndex`.
    @inlinable public func formIndex(after i: inout Int)

    /// Returns the position immediately before the given index.
    ///
    /// - Parameter i: A valid index of the collection. `i` must be greater than
    ///   `startIndex`.
    /// - Returns: The index immediately before `i`.
    @inlinable public func index(before i: Int) -> Int

    /// Replaces the given index with its predecessor.
    ///
    /// - Parameter i: A valid index of the collection. `i` must be greater than
    ///   `startIndex`.
    @inlinable public func formIndex(before i: inout Int)

    /// Returns an index that is the specified distance from the given index.
    ///
    /// The following example obtains an index advanced four positions from an
    /// array's starting index and then prints the element at that position.
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     let i = numbers.index(numbers.startIndex, offsetBy: 4)
    ///     print(numbers[i])
    ///     // Prints "50"
    ///
    /// The value passed as `distance` must not offset `i` beyond the bounds of
    /// the collection.
    ///
    /// - Parameters:
    ///   - i: A valid index of the array.
    ///   - distance: The distance to offset `i`.
    /// - Returns: An index offset by `distance` from the index `i`. If
    ///   `distance` is positive, this is the same value as the result of
    ///   `distance` calls to `index(after:)`. If `distance` is negative, this
    ///   is the same value as the result of `abs(distance)` calls to
    ///   `index(before:)`.
    @inlinable public func index(_ i: Int, offsetBy distance: Int) -> Int

    /// Returns an index that is the specified distance from the given index,
    /// unless that distance is beyond a given limiting index.
    ///
    /// The following example obtains an index advanced four positions from an
    /// array's starting index and then prints the element at that position. The
    /// operation doesn't require going beyond the limiting `numbers.endIndex`
    /// value, so it succeeds.
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let i = numbers.index(numbers.startIndex,
    ///                              offsetBy: 4,
    ///                              limitedBy: numbers.endIndex) {
    ///         print(numbers[i])
    ///     }
    ///     // Prints "50"
    ///
    /// The next example attempts to retrieve an index ten positions from
    /// `numbers.startIndex`, but fails, because that distance is beyond the
    /// index passed as `limit`.
    ///
    ///     let j = numbers.index(numbers.startIndex,
    ///                           offsetBy: 10,
    ///                           limitedBy: numbers.endIndex)
    ///     print(j)
    ///     // Prints "nil"
    ///
    /// The value passed as `distance` must not offset `i` beyond the bounds of
    /// the collection, unless the index passed as `limit` prevents offsetting
    /// beyond those bounds.
    ///
    /// - Parameters:
    ///   - i: A valid index of the array.
    ///   - distance: The distance to offset `i`.
    ///   - limit: A valid index of the collection to use as a limit. If
    ///     `distance > 0`, `limit` has no effect if it is less than `i`.
    ///     Likewise, if `distance < 0`, `limit` has no effect if it is greater
    ///     than `i`.
    /// - Returns: An index offset by `distance` from the index `i`, unless that
    ///   index would be beyond `limit` in the direction of movement. In that
    ///   case, the method returns `nil`.
    ///
    /// - Complexity: O(1)
    @inlinable public func index(_ i: Int, offsetBy distance: Int, limitedBy limit: Int) -> Int?

    /// Returns the distance between two indices.
    ///
    /// - Parameters:
    ///   - start: A valid index of the collection.
    ///   - end: Another valid index of the collection. If `end` is equal to
    ///     `start`, the result is zero.
    /// - Returns: The distance between `start` and `end`.
    @inlinable public func distance(from start: Int, to end: Int) -> Int

    /// Accesses the element at the specified position.
    ///
    /// The following example uses indexed subscripting to update an array's
    /// second element. After assigning the new value (`"Butler"`) at a specific
    /// position, that value is immediately available at that same position.
    ///
    ///     var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     streets[1] = "Butler"
    ///     print(streets[1])
    ///     // Prints "Butler"
    ///
    /// - Parameter index: The position of the element to access. `index` must be
    ///   greater than or equal to `startIndex` and less than `endIndex`.
    ///
    /// - Complexity: Reading an element from an array is O(1). Writing is O(1)
    ///   unless the array's storage is shared with another array or uses a
    ///   bridged `NSArray` instance as its storage, in which case writing is
    ///   O(*n*), where *n* is the length of the array.
    @inlinable public subscript(index: Int) -> Element

    /// Accesses a contiguous subrange of the array's elements.
    ///
    /// The returned `ArraySlice` instance uses the same indices for the same
    /// elements as the original array. In particular, that slice, unlike an
    /// array, may have a nonzero `startIndex` and an `endIndex` that is not
    /// equal to `count`. Always use the slice's `startIndex` and `endIndex`
    /// properties instead of assuming that its indices start or end at a
    /// particular value.
    ///
    /// This example demonstrates getting a slice of an array of strings, finding
    /// the index of one of the strings in the slice, and then using that index
    /// in the original array.
    ///
    ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     let streetsSlice = streets[2 ..< streets.endIndex]
    ///     print(streetsSlice)
    ///     // Prints "["Channing", "Douglas", "Evarts"]"
    ///
    ///     let i = streetsSlice.firstIndex(of: "Evarts")    // 4
    ///     print(streets[i!])
    ///     // Prints "Evarts"
    ///
    /// - Parameter bounds: A range of integers. The bounds of the range must be
    ///   valid indices of the array.
    @inlinable public subscript(bounds: Range<Int>) -> ArraySlice<Element>

    /// The number of elements in the array.
    @inlinable public var count: Int { get }

    /// A sequence that represents a contiguous subrange of the collection's
    /// elements.
    ///
    /// This associated type appears as a requirement in the `Sequence`
    /// protocol, but it is restated here with stricter constraints. In a
    /// collection, the subsequence should also conform to `Collection`.
    public typealias SubSequence = ArraySlice<Element>
}
*/
// MARK: - Mathematic's operations

extension Vector {
    // Vector - Vector

    public static func += (lhs: inout Self, rhs: Self) { lhs = lhs + rhs }
    public static func + (lhs: Self, rhs: Self) -> Self {
        precondition(lhs.count == rhs.count)
        return Self(lhs.enumerated().map { $0.element + rhs[$0.offset] })
    }

    public static func -= (lhs: inout Self, rhs: Self) { lhs = lhs - rhs }
    public static func - (lhs: Self, rhs: Self) -> Self {
        precondition(lhs.count == rhs.count)
        return Self(lhs.enumerated().map { $0.element - rhs[$0.offset] })
    }

    public static func *= (lhs: inout Self, rhs: Self) { lhs = lhs * rhs }
    public static func * (lhs: Self, rhs: Self) -> Self {
        precondition(lhs.count == rhs.count)
        return Self(lhs.enumerated().map { $0.element * rhs[$0.offset] })
    }

    public static func /= (lhs: inout Self, rhs: Self) { lhs = lhs / rhs }
    public static func / (lhs: Self, rhs: Self) -> Self {
        precondition(lhs.count == rhs.count)
        return lhs // Self(lhs.enumerated().map { $0.element / rhs[$0.offset] })
    }

    // Vector - Scalar

    public static func += (lhs: inout Self, rhs: Element) { lhs = lhs + rhs }
    public static func + (lhs: Element, rhs: Self) -> Self { rhs + lhs }
    public static func + (lhs: Self, rhs: Element) -> Self { Self(lhs.datas.map { $0 + rhs }) }

    public static func -= (lhs: inout Self, rhs: Element) { lhs = lhs - rhs }
    public static func - (lhs: Element, rhs: Self) -> Self { Self(rhs.datas.map { lhs - $0 }) }
    public static func - (lhs: Self, rhs: Element) -> Self { Self(lhs.datas.map { $0 - rhs }) }

    public static func *= (lhs: inout Self, rhs: Element) { lhs = lhs * rhs }
    public static func * (lhs: Element, rhs: Self) -> Self { rhs * lhs }
    public static func * (lhs: Self, rhs: Element) -> Self { Self(lhs.datas.map { $0 * rhs }) }

    public static func /= (lhs: inout Self, rhs: Element) { lhs = lhs / rhs }
    public static func / (lhs: Element, rhs: Self) -> Self { rhs } //Self(rhs.datas.map { lhs / $0 }) }
    public static func / (lhs: Self, rhs: Element) -> Self { lhs } //Self(lhs.datas.map { $0 / rhs }) }
}

//extension Numeric {
//    public static func * <T: Numeric>(lhs: T, rhs: Self) -> T { T(Double(lhs) * Double(rhs)) }
//    public static func * <T: Numeric>(lhs: Self, rhs: T) -> Self { Self(Double(lhs) * Double(rhs)) }
//    public static func / <T: Numeric>(lhs: T, rhs: Self) -> T { T(Double(lhs) / Double(rhs)) }
//    //public static func / <T: Numeric>(lhs: Self, rhs: T) -> Self { Self(Double(lhs) / Double(rhs)) }
////    public static func / (lhs: Self, rhs: Self) -> Self { Self(Double(lhs) / Double(rhs)) }
//}
