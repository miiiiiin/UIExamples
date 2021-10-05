//
//  TimeSlotHorizontalContainerCell.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import UIKit

class TimeSlotHorizontalContainerCell: UICollectionViewCell, NibForName {
    
    @IBOutlet var slotCollectionView: UICollectionView!
    
    var items: [WeatherTimeSlot] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        slotCollectionView.register(TimeSlotWeatherCell.self)
        slotCollectionView.dataSource = self
        slotCollectionView.backgroundColor = .clear

        if let flowLayout = slotCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 50, height: 100)
        }
    }
    
    func reloadData(items: [WeatherTimeSlot]) {
        self.items = items
        slotCollectionView.reloadData()
    }
}

extension TimeSlotHorizontalContainerCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(TimeSlotWeatherCell.self, for: indexPath) else {
            return UICollectionViewCell()
        }
        
        let item = self.items[indexPath.item]
        cell.representImageView.image = UIImage(named: item.imageName)
        cell.temperatureLabel.text = item.temperature
        cell.timeLabel.text = item.time
        return cell
    }
}
