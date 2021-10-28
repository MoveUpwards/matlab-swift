//
//  MeanTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 28/10/2021.
//

import XCTest
@testable import MatLabSwift

class MeanTests: XCTestCase {
    func testMeanArray() throws {
        let a = [1, 0, 0, 1, 1, 0]
        XCTAssertEqual(MatLab.mean(a), 0.5)

        let b = [1, 2, 3, 4, 5]
        XCTAssertEqual(MatLab.mean(b), 3.0)
    }

    func testMeanMatrixColumns() throws {
        let a = Matrix(array: [[0, 1, 1], [2, 3, 2], [1, 3, 2], [4, 2, 2]])
        XCTAssertEqual(MatLab.mean(a), [1.7500, 2.2500, 1.7500])
    }

    func testMeanMatrixRows() throws {
        let a = Matrix(array: [[0, 1, 1], [2, 3, 2], [3, 0, 1], [1, 2, 3]])
        XCTAssertEqual(MatLab.mean(a, 2), [0.6666666666666666, 2.3333333333333335, 1.3333333333333333, 2.0])
    }
}
