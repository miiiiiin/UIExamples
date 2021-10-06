//
//  CustomTabBarController.swift
//  MusicPlayerUI
//
//  Created by Running Raccoon on 2021/10/06.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    var searchVC: SearchViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.9921568627, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
    }
}
