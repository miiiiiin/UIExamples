//
//  Extensions+CALayer.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/06.
//

import UIKit

extension CALayer {
    func fillCloudImage(_ rect: CGRect) {
        let bgImage = #imageLiteral(resourceName: "bg_weather")
        self.frame = rect
        self.contents = bgImage.cgImage
        self.contentsGravity = .resizeAspectFill
    }
}
