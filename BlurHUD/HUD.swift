//
//  BlurHUD.swift
//  HUD
//
//  Created by Elias Abel on 29/01/16.
//  Copyright © 2016 Bushtit Lab. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

public enum HUDContentType {
    case success
    case error
    case progress
    case image(UIImage?)
    case rotatingImage(UIImage?)

    case labeledSuccess(title: String?, subtitle: String?)
    case labeledError(title: String?, subtitle: String?)
    case labeledProgress(title: String?, subtitle: String?)
    case labeledImage(image: UIImage?, title: String?, subtitle: String?)
    case labeledRotatingImage(image: UIImage?, title: String?, subtitle: String?)

    case label(String?)
    case systemActivity
}

public final class BlurHUD {

    // MARK: Properties
    public static var dimsBackground: Bool {
        get { return HUD.sharedHUD.dimsBackground }
        set { HUD.sharedHUD.dimsBackground = newValue }
    }

    public static var allowsInteraction: Bool {
        get { return HUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled  }
        set { HUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = newValue }
    }

    public static var isVisible: Bool { return HUD.sharedHUD.isVisible }

    // MARK: Public methods, HUD based
    public static func show(_ content: HUDContentType, onView view: UIView? = nil) {
        HUD.sharedHUD.contentView = contentView(content)
        HUD.sharedHUD.show(onView: view)
    }

    public static func hide(_ completion: ((Bool) -> Void)? = nil) {
        HUD.sharedHUD.hide(animated: false, completion: completion)
    }

    public static func hide(animated: Bool, completion: ((Bool) -> Void)? = nil) {
        HUD.sharedHUD.hide(animated: animated, completion: completion)
    }

    public static func hide(afterDelay delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        HUD.sharedHUD.hide(afterDelay: delay, completion: completion)
    }

    // MARK: Public methods, BlurHUD based
    public static func flash(_ content: HUDContentType, onView view: UIView? = nil) {
        BlurHUD.show(content, onView: view)
        BlurHUD.hide(animated: true, completion: nil)
    }

    public static func flash(_ content: HUDContentType, onView view: UIView? = nil, delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        BlurHUD.show(content, onView: view)
        BlurHUD.hide(afterDelay: delay, completion: completion)
    }

    // MARK: Private methods
    fileprivate static func contentView(_ content: HUDContentType) -> UIView {
        switch content {
        case .success:
            return HUDSuccessView()
        case .error:
            return HUDErrorView()
        case .progress:
            return HUDProgressView()
        case let .image(image):
            return HUDSquareBaseView(image: image)
        case let .rotatingImage(image):
            return HUDRotatingImageView(image: image)

        case let .labeledSuccess(title, subtitle):
            return HUDSuccessView(title: title, subtitle: subtitle)
        case let .labeledError(title, subtitle):
            return HUDErrorView(title: title, subtitle: subtitle)
        case let .labeledProgress(title, subtitle):
            return HUDProgressView(title: title, subtitle: subtitle)
        case let .labeledImage(image, title, subtitle):
            return HUDSquareBaseView(image: image, title: title, subtitle: subtitle)
        case let .labeledRotatingImage(image, title, subtitle):
            return HUDRotatingImageView(image: image, title: title, subtitle: subtitle)

        case let .label(text):
            return HUDTextView(text: text)
        case .systemActivity:
            return HUDSystemActivityIndicatorView()
        }
    }
}
