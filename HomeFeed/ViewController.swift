//
//  ViewController.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 02/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit

let cellId = "cellID"

var posts = Posts()

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //var posts = [Post]()
    
    override func didReceiveMemoryWarning() {
        //imageCache = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memoryCapacity = 500 * 1024 * 1024
        let diskCapacity = 500 * 1024 * 1024
        
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "myDiskPath")
        URLCache.shared = urlCache
        
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        navigationItem.title = "Facebook Feed"
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)//FeedCell class controlls cells
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return posts.postList.count
        
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        //feedCell.post = posts[indexPath.item]
        feedCell.post = posts.postList[indexPath.item]
        
        
            return feedCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //if let statusText = posts[indexPath.item].statusText{
          if let statusText = posts.postList[indexPath.item].statusText{
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight: CGFloat = 8+44+4+5+200+65
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 25)
            
        }
        
        return CGSize(width: view.frame.width, height: 500)//300
    }
    
}



