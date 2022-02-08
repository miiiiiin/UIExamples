//
//  StickyTableView.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import Foundation
import UIKit

class StickyTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        
        self.backgroundColor = UIColor.clear
        self.tableFooterView = UIView()
    }
}
