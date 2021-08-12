//
//  Theme.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import UIKit

struct Theme {
    
    static public func defaultTheme() {
        let tintColor = UIColor.darkGray
        UILabel.appearance().textColor = tintColor
        UIImageView.appearance().tintColor = tintColor
    }

    static public func darkTheme() {
        let tintColor = UIColor.white
        UILabel.appearance().textColor = tintColor
        UIImageView.appearance().tintColor = tintColor
    }
}
