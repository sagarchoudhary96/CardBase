//
//  WalkThroughViewController.swift
//  Blockstack_Example
//
//  Created by GAURAV NAYAK on 23/01/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class WalkThroughViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let topLabel = ["Simplify Contact Sharing", "Maintain Privacy", "Earn Trust", "Privately Chat"]
    let decriptionLabel = ["Share your contact data without compromising your privacy.", "Prove you're a unique person while preserving your privacy.", "Based on the number and strength of connections that you make.", "Privately Chat with your contacts."]
    let imageName = ["1", "2", "3", "4"]
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func actionNext(_ sender: UIButton) {

        if self.pageIndicator.currentPage == 2 {
            self.nextButton.setTitle("Done", for: .normal)
        }
        if self.pageIndicator.currentPage == 3 {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            let VC =  self.storyboard?.instantiateViewController(withIdentifier: "MainView")
            self.present(VC!, animated: true, completion: nil)
        }
        let collectionBounds = self.collectionView.bounds
        let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x + collectionBounds.size.width))
        self.pageIndicator.currentPage = self.pageIndicator.currentPage + 1
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkThroughCell", for: indexPath) as! WalkThroughCollectionViewCell
        cell.topLabel.text = self.topLabel[indexPath.row]
        cell.walkImage.image = UIImage(named: self.imageName[indexPath.row])
        cell.descriptionLabel.text = self.decriptionLabel[indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.nextButton.tag = 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (CGSize(width: self.view.frame.width, height: self.collectionView.frame.height))
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageIndicator.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.nextButton.tag = pageIndicator.currentPage
    }

}

class WalkThroughCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var walkImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
