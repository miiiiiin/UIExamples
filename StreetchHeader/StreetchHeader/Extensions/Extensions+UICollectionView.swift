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
    
    func register <T: UICollectionReusableView & NibForName> (_ reusableCell: T.Type, kind: String) {
        register(reusableCell.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusableCell.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell & NibForName> (_ reusableCell: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: reusableCell.identifier, for: indexPath) as? T
    }
    
    func dequeueReusableSupplementaryView <T: UICollectionReusableView & NibForName> (
        _ reusableCell: T.Type,
        kind: String,
        for indexPath: IndexPath) -> T? {
        print("cell identifier:  \(reusableCell.identifier)")
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reusableCell.identifier, for: indexPath) as? T
    }
    
    var rowWidth: CGFloat {
        guard let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return safeAreaLayoutGuide.layoutFrame.width
                - contentInset.left
                - contentInset.right
        }
        
        let sectionInset = collectionViewLayout.sectionInset
        return safeAreaLayoutGuide.layoutFrame.width
            - sectionInset.left
            - sectionInset.right
            - contentInset.left
            - contentInset.right
    }
}
