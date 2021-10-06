//
//  ViewStyle.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/06.
//

import Foundation
import UIKit

struct ViewStyle<T> {
    let style: (T) -> T
}

protocol Stylable {
    init()
}

extension UIView: Stylable {
    
}

extension Stylable {
    
    init(style: ViewStyle<Self>) {
        self.init()
        
    }
    
    @discardableResult
    func apply(_ style: ViewStyle<Self>) -> Self {
        let a = style.style(self)
        print("stylable type: \(a), \(style)")
        return style.style(self)
    }
}
