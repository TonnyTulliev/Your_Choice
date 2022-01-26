//
//  UIImageView + Extension.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 26.01.2022.
//

import Foundation
import UIKit

extension UIImageView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 12
        rotation.isCumulative = false
        rotation.repeatCount = 0.5
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
