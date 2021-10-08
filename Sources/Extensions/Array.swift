//
//  File.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension Array {
    ///
    /// Creates a new array containing the specified number of a single, repeated value.
    ///
    /// Here's an example of creating an array initialized with five strings containing the letter *Z*.
    ///
    ///     let fiveZs = Array(repeating: "Z", count: 5)
    ///     print(fiveZs)
    ///     // Prints "["Z", "Z", "Z", "Z", "Z"]"
    ///
    /// - Parameters:
    ///   - value: The element to repeat.
    ///   - count: The number of times to repeat the value passed in the `repeating` parameter. `count` will be zero if negative.
    init(repeating value: Element, safeCount count: Int) {
        self = .init(repeating: value, count: count > 0 ? count : 0)
    }
}
