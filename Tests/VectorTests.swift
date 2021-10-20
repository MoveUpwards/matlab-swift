//
//  VectorTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 19/10/2021.
//

import XCTest
@testable import MatLabSwift

class VectorTests: XCTestCase {
    func testInit() throws {
        let a = Vector([1, 2, 3])
        XCTAssertEqual(a.datas, [1, 2, 3])

        let b = Vector(repeating: 1.0, count: 4)
        XCTAssertEqual(b.datas, [1.0, 1.0, 1.0, 1.0])
        XCTAssertNotEqual(b.datas, [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(b, Vector([1.0, 1.0, 1.0, 1.0]))
        XCTAssertNotEqual(b, Vector([1.0, 2.0, 3.0, 4.0]))
        XCTAssertEqual(Array(b), [1.0, 1.0, 1.0, 1.0])
        XCTAssertNotEqual(Array(b), [1.0, 2.0, 3.0, 4.0])
    }

    func testSubscript() throws {
        let a = Vector([1, 2, 3])
        XCTAssertEqual(a[0], 1)
        XCTAssertEqual(a[1..<2].datas, [2])
        XCTAssertEqual(a[1..<2], Vector([2]))
        XCTAssertEqual(Array(a[1..<2]), [2])

        XCTAssertEqual(a[1...2].datas, [2, 3])
        XCTAssertEqual(a[1...2], Vector([2, 3]))
        XCTAssertEqual(Array(a[1...2]), [2, 3])
    }

    func testOperator() throws {
        let a = Vector(repeating: 1.5, count: 4)
        XCTAssertEqual(a + 2.5, Vector(repeating: 4.0, count: 4))
        XCTAssertEqual(a - 2.5, Vector(repeating: -1.0, count: 4))
        XCTAssertEqual(a * 2.5, Vector(repeating: 3.75, count: 4))
        XCTAssertEqual(a / 2.5, Vector(repeating: 0.6, count: 4))

        let b = Vector(repeating: 0.5, count: 4)
        XCTAssertEqual(a + b, Vector(repeating: 2.0, count: 4))
        XCTAssertEqual(a - b, Vector(repeating: 1.0, count: 4))
        XCTAssertEqual(a * b, Vector(repeating: 0.75, count: 4))
        XCTAssertEqual(a / b, Vector(repeating: 3.0, count: 4))

        let c = Vector([1, 2, 3, 4])
        XCTAssertEqual(c.map { $0 + 1 }, [2, 3, 4, 5])
        XCTAssertEqual(c.map { $0 - 2 }, [-1, 0, 1, 2])
        XCTAssertEqual(c.map { $0 * 3 }, [3, 6, 9, 12])
        XCTAssertEqual(c.map { $0 / 4 }, [0, 0, 0, 1])

        XCTAssertEqual(c + 1, Vector([2, 3, 4, 5]))
        XCTAssertEqual(c - 2, Vector([-1, 0, 1, 2]))
        XCTAssertEqual(c * 3, Vector([3, 6, 9, 12]))
        XCTAssertEqual(c / 4, Vector([0, 0, 0, 1]))

        let d = Vector([1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(d.map { $0 + 1.0 }, [2.0, 3.0, 4.0, 5.0])
        XCTAssertEqual(d.map { $0 - 2.0 }, [-1.0, 0.0, 1.0, 2.0])
        XCTAssertEqual(d.map { $0 * 3.0 }, [3.0, 6.0, 9.0, 12.0])
        XCTAssertEqual(d.map { $0 / 4.0 }, [0.25, 0.5, 0.75, 1.0])

        XCTAssertEqual(d + 1.0, Vector([2.0, 3.0, 4.0, 5.0]))
        XCTAssertEqual(d - 2.0, Vector([-1.0, 0.0, 1.0, 2.0]))
        XCTAssertEqual(d * 3.0, Vector([3.0, 6.0, 9.0, 12.0]))
        XCTAssertEqual(d / 4.0, Vector([0.25, 0.5, 0.75, 1.0]))
    }

    func testZeroOnOperator() throws {
        let a = Vector([1.0, 4.0, -3.0])
        let b = Vector([2.0, -1.0, 0.0])

        XCTAssertEqual(a + b, Vector([3.0, 3.0, -3.0]))
        XCTAssertEqual(a - b, Vector([-1.0, 5.0, -3.0]))
        XCTAssertEqual(a * b, Vector([2.0, -4.0, 0.0]))
        XCTAssertEqual(a / b, Vector([0.5, -4.0, -.infinity]))
    }
}
