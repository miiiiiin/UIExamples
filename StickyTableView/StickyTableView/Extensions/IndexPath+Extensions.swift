//
//  IndexPath+Extensions.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import Foundation

extension IndexPath {

    var description: String {
        return "[\(section),\(row)]"
    }

    static let zero = IndexPath(row: 0, section: 0)

//    func advance(row: Int) -> IndexPath {
//        return IndexPath(row: self.row + row, section: section)
//    }
}
