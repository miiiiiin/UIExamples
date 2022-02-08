//
//  Row.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import Foundation

class Row {
    var cellIdentifier: String { get { return "" } }
    var title: String!
    var detail: String!
    var children: [Row]?

    init(json: [String : Any]) {
        title = json["title"] as? String ?? "Title"
        detail = json["detail"] as? String ?? "Detail"
//        if let items = json["children"] as? [[String : Any]] {
//            children = items.map { Row.getObject(json: $0) }
//        }
    }
}
