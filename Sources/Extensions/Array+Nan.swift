//
//  Array+Nan.swift
//  
//
//  Created by Damien Noël Dubuisson on 13/10/2021.
//

public extension Array where Element: Numeric {
    static func ==(lhs: Array<Element>, rhs: Array<Element>) -> Bool {
        guard lhs.count == rhs.count else { return false }
        for i in 0..<lhs.count {
            if let lValue = lhs[i] as? Nan, let rValue = rhs[i] as? Nan {
                guard lhs[i] == rhs[i] || (lValue.isNaN && rValue.isNaN) else { return false }
            } else {
                guard lhs[i] == rhs[i] else { return false }
            }
        }
        return true
    }
}
