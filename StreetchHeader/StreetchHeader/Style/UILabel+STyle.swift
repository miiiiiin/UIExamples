//
//  UILabel+STyle.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/06.
//

import UIKit

extension ViewStyle where T: UILabel {

    static var headerTitle: ViewStyle<T> {
        return ViewStyle<T> { label in
            label.textColor = .white
            label.setTextSize(40)
            label.textAlignment = .center
            return label
        }
    }
    
    static var headerSubTitle: ViewStyle<T> {
        return ViewStyle<T> { label in
            label.textColor = .white
            label.setTextSize(20)
            label.textAlignment = .center
            return label
        }
    }
}
