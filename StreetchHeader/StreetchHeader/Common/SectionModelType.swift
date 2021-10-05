//
//  SectionModelType.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import Foundation

protocol SectionModelType: IdentifiableType where Item: IdentifiableType, Item: Equatable {
    associatedtype Item
    
    var items: [Item] { get }
    
    init(items: [Item])
}
