//
//  NotificationViewController.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 04/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit

class NotificationsViewController: UITableViewController {
    static let rowHeight: CGFloat = 60
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Notifications"
        
        
        tableView.tableFooterView = UIView()
        tableView.register(NotificationCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NotificationsViewController.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NotificationCell
        if indexPath.row % 2 == 0 {
            if let name = posts.postList[0].name{
            cell.nameLabel.text = name
            cell.messageLabel.text = "\(name) liked your post"
            }
            if let profileImageName = posts.postList[0].profileImageName{
            cell.profileImage.image = UIImage(named: profileImageName)
            }
            
        }else{
            if let name = posts.postList[1].name{
            cell.nameLabel.text = posts.postList[1].name
            cell.nameLabel.text = name
                cell.messageLabel.text = "\(name) liked your post"
            }
            if let profileImageName = posts.postList[1].profileImageName{
                cell.profileImage.image = UIImage(named: profileImageName)
            }
        }
        return cell
    }
    
}

class NotificationCell: UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.layer.cornerRadius = 0.41666667 * NotificationsViewController.rowHeight//25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    let messageLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        label.numberOfLines = 2
        return label
    }()
    
    func setupViews() {
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(messageLabel)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(50)]-8-[v1]-8-|", views: profileImage, nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(50)]", views: profileImage)
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1]", views: nameLabel, messageLabel)
        addConstraintsWithFormat(format: "H:|-74-[v0]-8-|", views: messageLabel)//66
    }
}
