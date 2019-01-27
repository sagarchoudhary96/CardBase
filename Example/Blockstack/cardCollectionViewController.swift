//
//  cardCollectionViewController.swift
//  Blockstack_Example
//
//  Created by Sagar Choudhary on 27/01/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class cardCollectionViewController: UICollectionView {

    
    let labelArray = ["Work", "Personal", "Phone", "Email"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
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
        
        cell.profileImage.layer.masksToBounds = true
        cell.profileImage.layer.borderWidth = 1.5
        cell.profileImage.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (800/2) - 24, height: 114.0)
    }

}
