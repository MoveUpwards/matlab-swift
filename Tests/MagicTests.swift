//
//  MagicTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 26/10/2021.
//

import XCTest
@testable import MatLabSwift

class MagicTests: XCTestCase {
    private func checkMagic<T: Numeric>(on matrix: Matrix<T>) throws {
        XCTAssertTrue(matrix.is2dMatrix)
        let n = matrix.rowsCount
        let expected = T(n*(n*n+1)/2)
        for i in 0..<n {
            XCTAssertEqual(matrix.rows(at: i).allValues.reduce(0, +), expected)
            XCTAssertEqual(matrix.columns(at: i).allValues.reduce(0, +), expected)
        }
    }

    func testMagic() throws {
        let m3: Matrix<Int> = MatLab.magic(3)
        try checkMagic(on: m3)
        // MatLab expection:
        XCTAssertEqual(m3, Matrix(array: [[8, 1, 6], [3, 5, 7], [4, 9, 2]]))

        let m4: Matrix<Double> = MatLab.magic(4)
        try checkMagic(on: m4)
        // MatLab expection:
        XCTAssertEqual(m4, Matrix(array: [[16.0, 2.0, 3.0, 13.0],
                                          [5.0, 11.0, 10.0, 8.0],
                                          [9.0, 7.0, 6.0, 12.0],
                                          [4.0, 14.0, 15.0, 1.0]]))

        let m5: Matrix<Int> = MatLab.magic(5)
        try checkMagic(on: m5)
        // MatLab expection:
        XCTAssertEqual(m5, Matrix(array: [[17, 24, 1, 8, 15],
                                          [23, 5, 7, 14, 16],
                                          [4, 6, 13, 20, 22],
                                          [10, 12, 19, 21, 3],
                                          [11, 18, 25, 2, 9]]))

        let m6: Matrix<Int> = MatLab.magic(6)
        try checkMagic(on: m6)
        // MatLab expection:
        XCTAssertEqual(m6, Matrix(array: [[35, 1, 6, 26, 19, 24],
                                          [3, 32, 7, 21, 23, 25],
                                          [31, 9, 2, 22, 27, 20],
                                          [8, 28, 33, 17, 10, 15],
                                          [30, 5, 34, 12, 14, 16],
                                          [4, 36, 29, 13, 18, 11]]))
    }
}
