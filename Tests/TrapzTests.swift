//
//  TrapzTests.swift
//  MatLabSwiftTests
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class TrapzTests: XCTestCase {
    func testTrapz() throws {
        let y = [1.0, 4.0, 9.0, 16.0, 25.0]
        let q = try MatLab.trapz(y)
        XCTAssertEqual(q, 42.0)

        let x1 = stride(from: 0.0, through: .pi, by: .pi/100.0).map { Double($0) }
        let y1 = x1.map { sin($0) }
        let q1 = try MatLab.trapz(intervals: x1, y1)
        XCTAssertEqual(q1, 1.999342104837626) // Should be 1.9998
    }

    func testCumtrapz() throws {
        let y = [1.0, 4.0, 9.0, 16.0, 25.0]

        let result = try MatLab.cumtrapz(y)
        XCTAssertEqual(result, [0.0, 2.5, 9.0, 21.5, 42.0])

        let x1 = stride(from: 0.0, through: .pi, by: .pi/5.0).map { Double($0) }
        let y1 = x1.map { sin($0) }
        let q1 = try MatLab.cumtrapz(intervals: x1, y1)
        XCTAssertEqual(q1, [0.0,
                            0.18465818304904566,
                            0.6680995825722469,
                            1.2656660155205581,
                            1.7491074150437596,
                            1.9337655980928052])
    }
}
