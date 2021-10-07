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
            case .emptyArray: return "Array cannot be empty"
            case .wrongIntervalsSize: return ""
            }
        }
    }

    ///
    /// trapz(y) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/trapz.html)
    ///
    /// - Parameters:
    ///     - y: Input vectors. By default, trapz integrates along the first dimension of Y whose size does not equal 1.
    ///
    /// - Returns:
    ///     Calculate the integral of a vector where the spacing between data points is 1.
    ///
    static func trapz(_ y: [Double]) throws -> Double {
        return try trapz(intervals: (0..<y.count).map { Double($0) }, y)
    }

    ///
    /// trapz(y) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/trapz.html)
    ///
    /// - Parameters:
    ///     - u: Point spacing, specified as 1 (default), a uniform scalar spacing, or a vector of coordinates.
    ///     - y: Input vectors. By default, trapz integrates along the first dimension of Y whose size does not equal 1.
    ///
    /// - Returns:
    ///     The integral of a vector where the spacing between data points is uniform, but not equal to 1.
    ///
    static func trapz(intervals: [Double], _ array: [Double]) throws -> Double {
        return try cumtrapz(intervals: intervals, array).last ?? .zero
    }

    ///
    /// cumtrapz(y) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/cumtrapz.html)
    ///
    /// - Parameters:
    ///     - y: Input vectors. By default, trapz integrates along the first dimension of Y whose size does not equal 1.
    ///
    /// - Returns:
    ///     Calculate the integral of a vector where the spacing between data points is 1.
    ///
    static func cumtrapz(_ array: [Double]) throws -> [Double] {
        return try cumtrapz(intervals: (0..<array.count).map { Double($0) }, array)
    }

    ///
    /// cumtrapz(y) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/cumtrapz.html)
    ///
    /// - Parameters:
    ///     - u: Point spacing, specified as 1 (default), a uniform scalar spacing, or a vector of coordinates.
    ///     - y: Input vectors. By default, trapz integrates along the first dimension of Y whose size does not equal 1.
    ///
    /// - Returns:
    ///     The integral of a vector where the spacing between data points is uniform, but not equal to 1.
    ///
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
