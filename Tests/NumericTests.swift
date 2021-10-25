//
//  NumericTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 22/10/2021.
//

import XCTest
@testable import MatLabSwift

class NumericTests: XCTestCase {
    private func compare<T: Numeric>(_ lhs: T, _ rhs: T) -> Bool { lhs == rhs }
    private func isPositive<T: Numeric>(_ value: T) -> Bool { value > .zero }
    private func isNegative<T: Numeric>(_ value: T) -> Bool { value < .zero }
    private func isTwoOrMore<T: Numeric>(_ value: T) -> Bool { value >= .one * 2 }
    private func isOneOrLess<T: Numeric>(_ value: T) -> Bool { value <= .one }
    private func multiply<T: Numeric>(_ lhs: T, _ rhs: T) -> T { lhs * rhs }
    private func divide<T: Numeric>(_ lhs: T, _ rhs: T) -> T { lhs / rhs }

    func testOne() throws {
        let iOne = Int.one
        let iArray: [Int] = [.one, iOne]
        XCTAssertTrue(compare(iArray[0], iArray[1]))

        let dOne = Double.one
        let dArray: [Double] = [.one, dOne]
        XCTAssertTrue(compare(dArray[0], dArray[1]))
    }

    func testUnaryMinus() throws {
        let one = Int.one
        let minusOne = -Int.one
        XCTAssertTrue(isPositive(one))
        XCTAssertTrue(isNegative(minusOne))
    }

    func testOperators() throws {
        XCTAssertTrue(isTwoOrMore(2))
        XCTAssertTrue(isOneOrLess(1))

        XCTAssertEqual(multiply(3, 4), 12)
        XCTAssertEqual(multiply(4.0, 2.0), 8.0)
        XCTAssertEqual(divide(8, 4), 2)
        XCTAssertEqual(divide(3.0, 4.0), 0.75)
    }
}
