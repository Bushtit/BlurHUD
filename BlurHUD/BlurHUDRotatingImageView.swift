//
//  HUDRotatingImageView.swift
//  HUD
//
//  Created by Mark Koh on 1/14/16.
//  Copyright © 2016 Bushtit Lab. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit
import QuartzCore

/// HUDRotatingImageView provides a content view that rotates the supplied image automatically.
open class HUDRotatingImageView: HUDSquareBaseView, HUDAnimating {

    public func startAnimation() {
        imageView.layer.add(HUDAnimation.continuousRotation, forKey: "progressAnimation")
    }

    public func stopAnimation() {
    }
}
