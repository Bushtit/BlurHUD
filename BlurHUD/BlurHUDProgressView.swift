//
//  HUDProgressVIew.swift
//  HUD
//
//  Created by Elias Abel on 6/12/15.
//  Copyright (c) 2016 Bushtit Lab. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit
import QuartzCore

/// HUDProgressView provides an indeterminate progress view.
open class HUDProgressView: HUDSquareBaseView, HUDAnimating {

    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(image: HUDAssets.progressActivityImage, title: title, subtitle: subtitle)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func startAnimation() {
        imageView.layer.add(HUDAnimation.discreteRotation, forKey: "progressAnimation")
    }

    public func stopAnimation() {
    }
}
