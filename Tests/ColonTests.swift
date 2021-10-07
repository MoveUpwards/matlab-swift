//
//  ColonTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class ColonTests: XCTestCase {
    // Tests from https://mathworks.com/help/matlab/ref/colon.html?s_tid=doc_ta

    func testColonOperator() throws {
        let a = 1∶10
        XCTAssertEqual(a, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        XCTAssertEqual(a.count, 10)

        XCTAssertEqual(0∶5, Array(0...5))
        XCTAssertEqual(-5∶5, Array(-5...5))

        XCTAssertEqual(0∶5, Array(stride(from: 0, through: 5, by: 1)))
        XCTAssertEqual(0∶5, stride(from: 0, through: 5, by: 1).map { Int($0) })
        XCTAssertEqual(-5∶5, Array(stride(from: -5, through: 5, by: 1)))
        XCTAssertEqual(-5∶5, stride(from: -5, through: 5, by: 1).map { Int($0) })
    }

    func testColonFunction() throws {
        XCTAssertEqual(MatLab.colon(1, 10), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

        XCTAssertEqual(MatLab.colon(0, 0.1, 1), [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0])

        XCTAssertEqual(MatLab.colon(10, -2, 0), [10, 8, 6, 4, 2, 0])

        XCTAssertEqual(MatLab.colon(0.5, 0.1, 1.5), [0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5])

        XCTAssertEqual(MatLab.colon(-5.0, 5.0), (-5∶5).map(Double.init)) // Test shortcut against the function

        XCTAssertEqual(MatLab.colon(Float(0), 0.1, .pi).last, 3.1)
    }

    func testColonError() throws {
        XCTAssertEqual(MatLab.colon(1, 0, 10), []) // step cannot be 0
        XCTAssertEqual(MatLab.colon(1, -1, 10), []) // 1 descending to 10 is impossible
        XCTAssertEqual(MatLab.colon(10, 1, 1), []) // 10 ascending to 1 is impossible
    }
}
