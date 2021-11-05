//
//  EigTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 02/11/2021.
//

import XCTest
@testable import MatLabSwift

class EigTests: XCTestCase {
    func testEig() throws {
        // Eigenvalues of Matrix
        let a = Matrix(array: [[1.0000, 0.5000, 0.3333, 0.2500],
                               [0.5000, 1.0000, 0.6667, 0.5000],
                               [0.3333, 0.6667, 1.0000, 0.7500],
                               [0.2500, 0.5000, 0.7500, 1.0000]])
//        XCTAssertEqual(MatLab.eig(a), Matrix(column: [0.2078, 0.4078, 0.8482, 2.5362]))
    }
}
