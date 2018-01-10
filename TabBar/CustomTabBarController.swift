//
//  CustomTabBarController.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 03/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbarSizeSetup()
        populateTabbar()
        
    }
    func populateTabbar(){
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        navigationController.title = "News Feed"
        navigationController.tabBarItem.image = UIImage(named: "news_feed")
        
        let friendRequestController = FriendRequestController()        
        friendRequestController.title = "Friend requests"
        let secondNavigationController = UINavigationController(rootViewController: friendRequestController)
        secondNavigationController.title = "Requests"
        secondNavigationController.tabBarItem.image = UIImage(named: "friend-request")
        
        let messageController = MessageViewController()
        messageController.title = "Messages"
        let thirdNavigationController = UINavigationController(rootViewController: messageController)
        thirdNavigationController.title = "Messages"
        thirdNavigationController.tabBarItem.image = UIImage(named: "message")
        
        let notificationController = NotificationsViewController()
        notificationController.title = "Notification"
        let forthNavigationController = UINavigationController(rootViewController: notificationController)
        forthNavigationController.title = "Notifications"
        forthNavigationController.tabBarItem.image = UIImage(named: "notifications_globe")
        
        let personalDetailController = PersonalDetailViewController()
        personalDetailController.title = "Me"
        let fifthNavigationController = UINavigationController(rootViewController: personalDetailController)
        fifthNavigationController.title = "Me"
        fifthNavigationController.tabBarItem.image = UIImage(named:"personal")
        
        viewControllers = [navigationController, secondNavigationController, thirdNavigationController, forthNavigationController, fifthNavigationController]
        
        }
    
    func tabbarSizeSetup(){
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 234).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        tabBar.isTranslucent = true
    }
    
}
