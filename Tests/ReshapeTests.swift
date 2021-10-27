//
//  ReshapeTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 26/10/2021.
//

import XCTest
@testable import MatLabSwift

class ReshapeTests: XCTestCase {
    func testReshape() throws {
        let a = 1∶10
        let b = MatLab.horzcat(Matrix(column: [1, 2, 3, 4, 5]), Matrix(column: [6, 7, 8, 9, 10]))
        XCTAssertEqual(MatLab.reshape(a, [5, 2]), b)

//        let c = m
    }
}
