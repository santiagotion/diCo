//
//  HomeVC.swift
//  diCo
//
//  Created by Santi on 17/08/2020.
//  Copyright © 2020 lgdev. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewContraintHeight: NSLayoutConstraint!
    @IBOutlet weak var searchField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            searchField.overrideUserInterfaceStyle = .light
            
           
        }

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    // Keep track of size of the vertical table view
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath ==  "contentSize" {
            
            if let newvalue = change?[.newKey]{
                let newSize = newvalue as! CGSize
                self.tableViewContraintHeight.constant = newSize.height
            }
            
        }
    }
    
    
    
    
    
    
    
    // Populate collection view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     
          
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
        
        return cell
  
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetails2", sender: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 5
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "popularCell", for: indexPath)
           return cell
           
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetails2", sender: indexPath)
        
    }
    
    
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   

}
