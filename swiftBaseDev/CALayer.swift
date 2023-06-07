//
//  CALayer.swift
//  swiftBaseDev
//
//  Created by jerei on 2022/8/25.
//  Copyright © 2022 jerei. All rights reserved.
//

import Foundation
import UIKit

extension CALayer{
    @IBInspectable var borderColorFromUIColor :UIColor {
        get {
            return UIColor(cgColor: self.borderColor!)
        }
        set {
            self.borderColor = newValue.cgColor
        }
    }
}
