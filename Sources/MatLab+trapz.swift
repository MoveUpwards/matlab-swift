//
//  MatLab+trapz.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension MatLab {
    enum TrapzError: Error, CustomDebugStringConvertible {
        case emptyArray
        case wrongIntervalsSize

        public var debugDescription: String {
            switch self {
            case .emptyArray: return ""
            case .wrongIntervalsSize: return ""
            }
        }
    }

    static func trapz(_ array: [Double]) throws -> Double {
        return try trapz(intervals: (0..<array.count).map { Double($0) }, array)
    }

    static func trapz(intervals: [Double], _ array: [Double]) throws -> Double {
        return try cumtrapz(intervals: intervals, array).last ?? .zero
    }

    static func cumtrapz(_ array: [Double]) throws -> [Double] {
        return try cumtrapz(intervals: (0..<array.count).map { Double($0) }, array)
    }

    static func cumtrapz(intervals: [Double], _ array: [Double]) throws -> [Double] {
        guard !array.isEmpty else { throw TrapzError.emptyArray }
        guard array.count == intervals.count else { throw TrapzError.wrongIntervalsSize }

        var result = [Double](repeating: .zero, count: array.count)
        for i in 1..<array.count {
            result[i] = result[i-1] + (array[i-1] + array[i]) * (intervals[1] - intervals[0]) / 2.0
        }
        return result
    }
}
