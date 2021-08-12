//
//  NibForName.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import UIKit

protocol NibForName: SwiftNameIdentifier {
    static var nib: UINib { get }
}

extension NibForName {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

protocol SwiftNameIdentifier {
    static var identifier: String { get }
}

extension SwiftNameIdentifier {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
