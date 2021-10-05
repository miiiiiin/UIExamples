//
//  CellAdapter.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import Foundation

protocol CellAdapter {
    var identifier: String { get }
    var itemCount: Int { get }
    
//    func item<T: Equatable>(for index: Int) -> T?
}
