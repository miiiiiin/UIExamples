//
//  IdentifiableType.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import Foundation

public protocol IdentifiableType {
    associatedtype Identity: Hashable
    
    var identity: Identity { get }
}
