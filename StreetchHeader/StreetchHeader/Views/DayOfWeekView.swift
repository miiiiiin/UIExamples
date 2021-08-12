//
//  DayOfWeekView.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import Foundation
import UIKit

class DayOfWeekView: UIView, NibLodable {
    
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
        setUpFromNib()
        representImage.contentMode = .scaleAspectFit
    }
    
    func configCell(_ item: WeatherDay) {
        self.dayOfWeekNameLabel.text = item.dayOfWeek.name
        self.representImage.image = UIImage(named: item.imgName)?.withRenderingMode(.alwaysTemplate)
        self.highestLabel.text = String(item.highestTemperature)
        self.lowestLabel.text = String(item.lowestTemperature)
    }
    
    func setClearBackgroundColor() {
        self.backgroundColor = .clear
        containerView.backgroundColor = .clear
        stackView.backgroundColor = .clear
    }
}
