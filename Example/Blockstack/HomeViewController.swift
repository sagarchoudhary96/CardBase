//
//  HomeViewController.swift
//  Blockstack_Example
//
//  Created by GAURAV NAYAK on 25/01/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Blockstack

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    var userProfileImage = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImage.layer.cornerRadius  = userImage.frame.width/2
        userImage.clipsToBounds =  true
        
        if Blockstack.shared.isUserSignedIn() {
            // Read user profile data
            let retrievedUserData = Blockstack.shared.loadUserData()
            userProfileImage = (retrievedUserData?.profile?.image![0].contentUrl)!
            do{
                userImage.image = UIImage(data: try Data(contentsOf: URL(string: (userProfileImage))!))
            }
            catch {
                
            }
            if let name = retrievedUserData?.profile?.name {
                username.text = name
            } else {
                username.text = " nameless user"
            }
        }

        // Do any additional setup after loading the view.
    }
    
    let labelArray = ["Work", "Personal", "Phone", "Email"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
        cell.labelTop.text = labelArray[indexPath.row]
        cell.randomView.backgroundColor = .random()
        
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0
        
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        do{
            cell.profileImage.image = UIImage(data: try Data(contentsOf: URL(string: (userProfileImage))!))
        }
        catch {
            
            
        }
        
        cell.profileImage.layer.masksToBounds = true
        cell.profileImage.layer.borderWidth = 1.5
        cell.profileImage.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width/2) - 24, height: 114.0)
    }
}

class HomeCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var randomView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var labelTop: UILabel!
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
