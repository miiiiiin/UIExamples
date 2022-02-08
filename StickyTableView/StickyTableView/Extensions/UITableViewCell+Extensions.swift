//
//  UITableViewCell+Extensions.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import Foundation
import UIKit

extension UITableViewCell {

    class func getDefaultSeparatorInsets() -> UIEdgeInsets {
        return UITableViewCell().separatorInset
    }

    func setSeperatorToZero() {
        setSeperator(edge: UIEdgeInsets.zero)
    }

    func setSeperator(edge: UIEdgeInsets) {
//        separatorInset = edge
//        layoutMargins = edge
    }
}
