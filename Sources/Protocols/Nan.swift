//
//  Nan.swift
//  
//
//  Created by Damien Noël Dubuisson on 13/10/2021.
//

public protocol Nan {
    static var nan: Self { get }
    var isNaN: Bool { get }
}

extension Double: Nan {}
extension Float: Nan {}
