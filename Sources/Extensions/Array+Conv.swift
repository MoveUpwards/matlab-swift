//
//  Array+Conv.swift
//  
//
//  Created by Damien Noël Dubuisson on 02/06/2021.
//

public extension Array where Element: FloatingPoint {
    ///
    /// conv(u,v,shape) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/conv.html)
    ///
    /// - Parameters:
    ///     - u: Input vectors.
    ///     - v: Input vectors.
    ///     - shape: Subsection of convolution.
    ///
    /// - Returns:
    ///     The convolution of vectors u and v.
    ///
    func conv(_ v: [Element], _ shape: MatLab.ConvShape = .full) -> [Element] {
        let u = self
        let m = u.count
        let n = v.count
        let convN = n+m-1

        var res = [Element](repeating: .zero, count: convN)

        // https://www.programmersought.com/article/54915179092/
        for i in 0..<convN {
            for j in Swift.max(0, i+1-n) ... Swift.min(i, m-1) {
                res[i] += u[j] * v[i-j]
            }
        }

        let expectedSize: Int

        switch shape {
        case .full:
            expectedSize = convN
        case .same:
            expectedSize = m
        case .valid:
            expectedSize = Swift.max(m-n+1, 0)
        }

        let endIndex = convN - (convN-expectedSize)/2 // Will round to lower it if (convN-size) is odd
        let startIndex = endIndex - expectedSize
        return Array(res[startIndex..<endIndex])
    }
}
