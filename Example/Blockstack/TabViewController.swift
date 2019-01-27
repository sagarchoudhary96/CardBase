//
//  TabViewController.swift
//  Blockstack_Example
//
//  Created by Sagar Choudhary on 27/01/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Blockstack

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signout(_ sender: Any) {
    
        // Sign user out
        Blockstack.shared.signUserOut()
        navigateToLogin()
    }
    @IBAction func addConnection(_ sender: Any) {
        //let cameraVc = UIImagePickerController()
        // cameraVc.sourceType = UIImagePickerControllerSourceType.camera
        // self.present(cameraVc, animated: true, completion: nil)
    }
    
    private func navigateToLogin() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
        DispatchQueue.main.async {
            self.present(vc!, animated: true, completion: nil)
        }
    }
}
