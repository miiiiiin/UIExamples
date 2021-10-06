//
//  DayOfWeekVerticalContainerCell.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import Foundation
import UIKit

class DayOfWeekVerticalContainerCell: UICollectionViewCell, NibForName {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [WeatherDaySlot] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(DayOfWeekCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.alwaysBounceVertical = false
        NotificationCenter.default.addObserver(self, selector: #selector(handleSetOffset), name: Notification.Name(rawValue: NotificationNames.setOffset), object: nil)
    }
    
    func reloadData(items: [WeatherDaySlot]) {
        self.items = items
        collectionView.reloadData()
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        }
        print("dayofweek cell items: \(items.count)")
    }
    
    @objc func handleSetOffset(notification: Notification) {
        if let offset = notification.object as? CGFloat {
            collectionView.contentOffset = CGPoint(x: 0, y: offset)
            print("handlesetoffset: \(offset)")
        }
    }
}

extension DayOfWeekVerticalContainerCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(DayOfWeekCell.self, for: indexPath) else { return UICollectionViewCell() }
        
        let item = items[indexPath.row]

        cell.weatherView.configCell(item)
        cell.weatherView.setClearBackgroundColor()
        cell.backgroundColor = .clear
        
        return cell
    }
}
