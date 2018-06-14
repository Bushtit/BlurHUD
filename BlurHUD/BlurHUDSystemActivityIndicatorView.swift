//
//  HUDSystemActivityIndicatorView.swift
//  HUD
//
//  Created by Elias Abel on 6/12/15.
//  Copyright (c) 2016 Bushtit Lab. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// HUDSystemActivityIndicatorView provides the system UIActivityIndicatorView as an alternative.
public final class HUDSystemActivityIndicatorView: HUDSquareBaseView, HUDAnimating {

    public init() {
        super.init(frame: HUDSquareBaseView.defaultSquareBaseViewFrame)
        commonInit()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit () {
        backgroundColor = UIColor.clear
        alpha = 0.8

        self.addSubview(activityIndicatorView)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.center = self.center
    }

    let activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.color = UIColor.black
        return activity
    }()

    public func startAnimation() {
        activityIndicatorView.startAnimating()
    }
}
