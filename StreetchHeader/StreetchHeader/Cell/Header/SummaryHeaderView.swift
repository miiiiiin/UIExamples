//
//  SummaryHeaderView.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import Foundation
import UIKit

class SummaryHeaderView: UICollectionReusableView, NibForName {
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var weatherDescLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.isOpaque = true

        cityLabel.apply(.headerTitle)
        temperatureLabel.apply(.headerTitle)
        weatherDescLabel.apply(.headerSubTitle)
    }
 
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let layoutAttributes = layoutAttributes as? OverlayAlphaLayoutAttributes else {
            return
        }
        temperatureLabel.alpha = layoutAttributes.headerOverlayAlpha
        weatherDescLabel.alpha = layoutAttributes.headerOverlayAlpha
    }
}
