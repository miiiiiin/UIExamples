//
//  Extensions+UICollectionView.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell & NibForName> (_ reusableCell: T.Type) {
        register(reusableCell.nib, forCellWithReuseIdentifier: reusableCell.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell & NibForName> (_ reusableCell: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: reusableCell.identifier, for: indexPath) as? T
    }
}
