//
//  RdivideTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 05/11/2021.
//

import XCTest
@testable import MatLabSwift

class RdivideTests: XCTestCase {
    func testRdivide() throws {
        // Divide Two Numeric Arrays
        let a = Matrix(array: [[2, 4, 6, 8], [3, 5, 7, 9]]).asDouble
        let b = 10.0 * MatLab.ones(2, 4)
        XCTAssertEqual(MatLab.rdivide(a, b), Matrix(array: [[0.2, 0.4, 0.6, 0.8], [0.3, 0.5, 0.7, 0.9]]))
        XCTAssertEqual(MatLab.rdivide(a, 10.0), Matrix(array: [[0.2, 0.4, 0.6, 0.8], [0.3, 0.5, 0.7, 0.9]]))

        // Integer Division
        let c = Int16(10)
        let d = Vector([Int16(3), 4, 6])
        // MATLAB® rounds the results when dividing integer data types.
        XCTAssertEqual(MatLab.rdivide(c, d), Vector([Int16(3), 2, 1])) // So it should be Vector([Int16(3), 3, 2])
        XCTAssertEqual(MatLab.rdivide(d, c), Vector([Int16(0), 0, 0])) // So it should be Vector([Int16(0), 0, 1])

        // Divide Scalar by Array
        let e = 5.0
        let f: Matrix<Double> = MatLab.magic(3)
        XCTAssertEqual(MatLab.rdivide(e, f), Matrix(array: [[0.6250, 5.0000, 0.8333333333333334],
                                                            [1.6666666666666667, 1.0000, 0.7142857142857143],
                                                            [1.2500, 0.5555555555555556, 2.5000]]))

        // Divide Row and Column Vectors
        let g = Matrix(row: [1.0, 2.0])
        let h = Matrix(column: [1.0, 2.0, 3.0])
        XCTAssertEqual(MatLab.rdivide(g, h), Matrix(array: [[1.0000, 2.0000],
                                                            [0.5000, 1.0000],
                                                            [0.3333333333333333, 0.6666666666666666]]))
        XCTAssertEqual(MatLab.rdivide(h, g), Matrix(array: [[1.0, 0.5],
                                                            [2.0, 1.0],
                                                            [3.0, 1.5]])) // TODO: Check in MatLab
    }
}
