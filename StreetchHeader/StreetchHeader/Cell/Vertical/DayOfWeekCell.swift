//
//  DayOfWeekCell.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import Foundation
import UIKit

class DayOfWeekCell: UICollectionViewCell, NibForName {
    
    @IBOutlet weak var weatherView: DayOfWeekView!
    
    func clearBackgroundcolor() {
        weatherView.setClearBackgroundColor()
        self.backgroundColor = .clear
    }
}
