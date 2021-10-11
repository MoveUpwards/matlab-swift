//
//  MatLab+conv.swift
//  
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

public extension MatLab {
    /// Subsection of the convolution
    enum ConvShape {
        /// Full convolution (default).
        case full
        /// Central part of the convolution of the same size as u.
        case same
        /// Only those parts of the convolution that are computed without the zero-padded edges. Using this option,
        /// length(w) is max(length(u)-length(v)+1,0), except when length(v) is zero. If length(v) = 0, then length(w) = length(u).
        case valid
    }

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
    static func conv<T: Numeric>(_ u: [T], _ v: [T], _ shape: ConvShape = .full) -> [T] { u.conv(v, shape) }
}
