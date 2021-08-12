//
//  DayOfWeekView.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import Foundation
import UIKit

class DayOfWeekView: UIView {
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var dayOfWeekNameLabel: UILabel!
    @IBOutlet weak var representImage: UIImageView!
    
    @IBOutlet weak var highestLabel: UILabel!
    
    @IBOutlet weak var lowestLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        representImage.contentMode = .scaleAspectFit
    }
    
    func setClearBackgroundColor() {
        self.backgroundColor = .clear
        containerView.backgroundColor = .clear
        stackView.backgroundColor = .clear
    }
}