//
//  StickyLayoutAttributes.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import UIKit

final class StickyLayoutAttributes: UICollectionViewLayoutAttributes {
    
    var initialOrigin: CGPoint = .zero
    
    override func copy(with zone: NSZone? = nil) -> Any {
        guard let copiedAttributes = super.copy(with: zone) as? StickyLayoutAttributes else { return super.copy(with: zone)}
        
        copiedAttributes.initialOrigin = initialOrigin
        return copiedAttributes
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let otherAttributes = object as? StickyLayoutAttributes else { return false }
        
        if otherAttributes.initialOrigin != initialOrigin {
            return false
        }
        
        return super.isEqual(object)
    }
}
