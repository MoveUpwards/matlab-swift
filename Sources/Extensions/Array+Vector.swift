//
//  Array+Vector.swift
//  
//
//  Created by Damien Noël Dubuisson on 19/10/2021.
//

public extension Array where Element: Numeric {
    init(_ vector: Vector<Element>) {
        self = vector.datas
    }
}
