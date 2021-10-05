//
//  TimeSlotWeatherCell.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import Foundation
import UIKit

class TimeSlotWeatherCell: UICollectionViewCell, NibForName {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var representImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        temperatureLabel.textAlignment = .center
    }
    
    func configCell(item: WeatherTimeSlot) {
        timeLabel.text = item.time
        representImageView.image = UIImage(named: item.imageName)?.withRenderingMode(.alwaysTemplate)
        temperatureLabel.text = item.temperature
    }
}
