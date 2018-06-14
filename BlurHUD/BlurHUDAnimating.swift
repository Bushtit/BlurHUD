//
//  HUDAnimatingContentView.swift
//  HUD
//
//  Created by Elias Abel on 9/27/15.
//  Copyright (c) 2016 Bushtit Lab. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

@objc public protocol HUDAnimating {

    func startAnimation()
    @objc optional func stopAnimation()
}
