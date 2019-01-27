//
//  ViewController.swift
//  Blockstack
//
//  Created by Yukan Liao on 03/27/2018.
//

import UIKit
import Blockstack
import SafariServices

class ViewController: UIViewController {
    @IBOutlet weak var resetKeychainButton: UIButton!
    @IBOutlet var signInButton: UIButton!

    override func viewDidLoad() {
        self.signInButton.isHidden = false
    }
    
    @IBAction func signIn() {
        // Address of deployed example web app
        Blockstack.shared.signIn(redirectURI: "https://pedantic-mahavira-f15d04.netlify.com/redirect.html",
                                 appDomain: URL(string: "https://pedantic-mahavira-f15d04.netlify.com")!, scopes: ["store_write", "publish_data"]) { authResult in
            switch authResult {
                case .success(let userData):
                    print("sign in success")
                    self.handleSignInSuccess(userData: userData)
                case .cancelled:
                    print("sign in cancelled")
                case .failed(let error):
                    print("sign in failed, error: ", error ?? "n/a")
            }
        }
    }
    
    func handleSignInSuccess(userData: UserData) {
        print(userData.profile?.name as Any)
        navigateToMainScreen()
    }
    
    @IBAction func resetDeviceKeychain(_ sender: Any) {
        Blockstack.shared.promptClearDeviceKeychain()
    }

    private func navigateToMainScreen() {
        print("here")
        let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBar")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        let connectionVc = self.storyboard?.instantiateViewController(withIdentifier: "Connection")
        tabBarController!.addChildViewController(vc!)
        tabBarController!.addChildViewController(connectionVc!)
        let navigationController = UINavigationController(rootViewController: tabBarController!)
        DispatchQueue.main.async {
            self.present(navigationController, animated: true, completion: nil)
        }
    }
}

