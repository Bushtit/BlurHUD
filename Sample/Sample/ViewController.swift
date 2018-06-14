//
//  ViewController.swift
//  Sample
//
//  Created by Elias Abel on 2017-06-15.
//  Copyright © 2017 Bushtit Lab. All rights reserved.
//

import UIKit
import BlurHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BlurHUD.dimsBackground = false
        BlurHUD.allowsInteraction = false
    }
    
    @IBAction func showAnimatedSuccessHUD(_ sender: AnyObject) {
        BlurHUD.flash(.success, delay: 2.0)
    }
    
    @IBAction func showAnimatedErrorHUD(_ sender: AnyObject) {
        BlurHUD.show(.error)
        BlurHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showAnimatedProgressHUD(_ sender: AnyObject) {
        BlurHUD.show(.progress)
        
        // Now some long running task starts...
        delay(2.0) {
            // ...and once it finishes we flash the BlurHUD for a second.
            BlurHUD.flash(.success, delay: 1.0)
        }
    }
    
    @IBAction func showCustomProgressHUD(_ sender: AnyObject) {
        let image = UIImage.init(named: "progress_circular", in: Bundle.init(for: BlurHUD.self), compatibleWith: nil)
        BlurHUD.flash(.rotatingImage(image), delay: 2.0)
    }
    
    @IBAction func showAnimatedStatusProgressHUD(_ sender: AnyObject) {
        BlurHUD.flash(.labeledProgress(title: "Loading", subtitle: "Please wait..."), delay: 2.0)
    }
    
    @IBAction func showTextHUD(_ sender: AnyObject) {
        BlurHUD.flash(.label("Requesting from the server..."), delay: 2.0) { _ in
            BlurHUD.flash(.labeledSuccess(title: nil, subtitle: "Obtained"), delay: 2.0)
        }
    }
    
    /*
     
     Please note that the above demonstrates the "porcelain" interface - a more concise and clean way to work with the BlurHUD.
     If you need more options and flexbility, feel free to use the underlying "plumbing". E.g.:
     */
    func flexbility() {
        HUD.sharedHUD.show()
        HUD.sharedHUD.contentView = HUDSuccessView(title: "Success!", subtitle: nil)
        HUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.allButUpsideDown
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func delay(_ delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
