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
    
    var items: [String] = [] //fixme
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(DayOfWeekCell.self)
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.alwaysBounceVertical = false
    
    }
}

extension DayOfWeekVerticalContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(DayOfWeekCell.self, for: indexPath) else { return UICollectionViewCell() }
        
        let item = items[indexPath.row]
        
//        cell.weatherView.configCell(slot: item) //fixme
        cell.weatherView.setClearBackgroundColor()
        cell.backgroundColor = .clear
        
        return cell
    }
}
