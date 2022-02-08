//
//  Section.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import Foundation

class Section {
    
    var header: String?
    var rows = [Row]()
    var footer: String?

    init(json: [String : Any]) {
        header = json["header"] as? String
        if let items = json["rows"] as? [[String : Any]] {
//            rows = items.map { Row.getObject(json: $0) }
        }
        footer = json["footer"] as? String
    }
}
