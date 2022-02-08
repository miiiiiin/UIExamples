//
//  ClassIdentifiable.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import UIKit

protocol ClassIdentifiable: class {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    static var reuseId: String {
        return String(describing: self)
    }
}
