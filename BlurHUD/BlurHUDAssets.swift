//
//  HUD.Assets.swift
//  HUD
//
//  Created by Elias Abel on 6/18/14.
//  Copyright (c) 2016 Bushtit Lab. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// HUDAssets provides a set of default images, that can be supplied to the HUD's content views.
open class HUDAssets: NSObject {

    open class var crossImage: UIImage { return HUDAssets.bundledImage(named: "cross") }
    open class var checkmarkImage: UIImage { return HUDAssets.bundledImage(named: "checkmark") }
    open class var progressActivityImage: UIImage { return HUDAssets.bundledImage(named: "progress_activity") }
    open class var progressCircularImage: UIImage { return HUDAssets.bundledImage(named: "progress_circular") }

    internal class func bundledImage(named name: String) -> UIImage {
        let bundle = Bundle(for: HUDAssets.self)
        let image = UIImage(named: name, in:bundle, compatibleWith:nil)
        if let image = image {
            return image
        }

        return UIImage()
    }
}
