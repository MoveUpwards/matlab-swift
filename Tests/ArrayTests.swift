//
//  ArrayTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 13/10/2021.
//

import XCTest
@testable import MatLabSwift

class ArrayTests: XCTestCase {
    func testSafeInit() throws {
        let a = [Double](repeating: .zero, safeCount: -2) // Won't crash and act as 0 size
        let b = [Double](repeating: .zero, count: 0)
        XCTAssertEqual(a, b)
    }

    func testChunked() throws {
        let a = [1, 2, 3, 4, 5, 6]
        XCTAssertEqual(a.chunked(into: 2), [[1, 2], [3, 4], [5, 6]])
        XCTAssertEqual(a.chunked(into: 3), [[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(a.chunked(into: 4), [[1, 2, 3, 4], [5, 6]])
    }
}
