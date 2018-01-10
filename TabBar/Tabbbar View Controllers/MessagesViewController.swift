//
//  MessagesViewController.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 04/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit

class MessageViewController: UITableViewController {
    static let cellID: String = "cellId"
    static let rowHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Messages"
        
        tableView.separatorColor = UIColor.rgb(red: 229, green: 231, blue: 235)
        tableView.tableFooterView = UIView()
        
        
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageViewController.cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageViewController.cellID, for: indexPath) as! MessageCell
      
        
        if indexPath.row % 2 == 0{
            
            if let profileImageName = posts.postList[0].profileImageName{
                cell.profileImage.image = UIImage(named: profileImageName)
            }
            if let profileName = posts.postList[0].name{
                cell.nameLabel.text = profileName
                cell.messageLabel.text = "Hello it's me \(profileName)"
            }
        }
        else{
            if let profileImageName = posts.postList[1].profileImageName{
                cell.profileImage.image = UIImage(named: profileImageName)
            }
            if let profileName = posts.postList[1].name{
                cell.nameLabel.text = profileName
                cell.messageLabel.text = "Hello it's me \(profileName) !!!!!!!!!"
            }
        }
 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return MessageViewController.rowHeight
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let showMessages: ShowMessages = ShowMessages()
       
        //set Nav bar title depending on the cell row pressed
        if indexPath.row % 2 == 0{
            if let profileName = posts.postList[0].name{
                showMessages.title = profileName
            }
        }
        else{
            if let profileName = posts.postList[1].name{
                showMessages.title = profileName
            }
        }
        
            self.navigationController?.pushViewController(showMessages, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        UIView.animate(withDuration: 1.5) {
            cell.alpha = 1
            cell.layer.transform = transform
        }
    }
    
}

class MessageCell: UITableViewCell{
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
        imageView.layer.cornerRadius = 0.41666667 * MessageViewController.rowHeight//25
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
    
    func setupViews(){
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(messageLabel)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(50)]-8-[v1]-8-|", views: profileImage, nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(50)]", views: profileImage)
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1]", views: nameLabel, messageLabel)
        addConstraintsWithFormat(format: "H:|-74-[v0]-8-|", views: messageLabel)//66
        
        
    }
    
}
