//
//  NormTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 28/10/2021.
//

import XCTest
@testable import MatLabSwift

class NormTests: XCTestCase {
    func testNormVector() throws {
        // Vector Magnitude
        let v = Vector([1, -2, 3])
        XCTAssertEqual(MatLab.norm(v), 3.7416573867739413)

        // 1-Norm of Vector
        let x = Vector([-2, 3, -1])
        XCTAssertEqual(MatLab.norm(x, 1), 6.0)

        // Euclidean Distance Between Two Points
        let a = Vector([0, 3])
        let b = Vector([-2, 1])
        XCTAssertEqual(MatLab.norm(b-a), 2.8284271247461903)

        // 2-Norm of Matrix
        let mat = Matrix(array: [[2, 0, 1], [-1, 1, 0], [-3, 3, 0]])
        XCTAssertEqual(MatLab.norm(mat), 4.72342126378479)
    }
}
