//
//  StickyTableViewCell.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import UIKit

class StickyTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        
        
    }
}

extension UITableViewCell: ClassIdentifiable {
    
}
