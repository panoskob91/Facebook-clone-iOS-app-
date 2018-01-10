//
//  FeedCell.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 03/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import Foundation
import UIKit



//Class for controlling cells behaviour
class FeedCell: UICollectionViewCell{

    var post: Post? {
        didSet{
           setupNameLocationStatusAndProfileImage()
            
            
            }
        }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        
        
        return label
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Meanwhile, beast turned to the dark side."
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        return textView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        //imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "MarkZukerberg")
        return imageView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "488 Likes  10.7K Comments"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    
    
    let commentButton: UIButton = FeedCell.buttonForTitle(title: "Comment", imageName: "comment")
    let likeButton: UIButton = FeedCell.buttonForTitle(title: "Like", imageName: "thumbsUp")
    let shareButton: UIButton = FeedCell.buttonForTitle(title: "Share", imageName: "Share")
    let moreOptionsButton: UIButton = FeedCell.buttonForTitle(title: "more", imageName: nil)
    
    static func buttonForTitle(title: String, imageName: String?) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        if let imageName = imageName{
        button.setImage(UIImage(named: imageName), for: .normal)
        }
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addSubview(moreOptionsButton)
        
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-5-[v2(200)]-65-|", views: profileImageView, statusTextView, statusImageView)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: statusImageView)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentsLabel)
        
        addConstraintsWithFormat(format: "V:[v0]-40-|", views: likesCommentsLabel)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(0.4)]-40-|", views: dividerLineView)
        
        //button constraints
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton,commentButton, shareButton)
        addConstraintsWithFormat(format: "V:[v0(25)]|", views: likeButton)//25
        addConstraintsWithFormat(format: "V:[v0(25)]|", views: commentButton)//25
        addConstraintsWithFormat(format: "V:[v0(25)]|", views: shareButton)//25
        //addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-5-[v2]-8-[v3]-8-[v4(0.4)]-8-[v5(44)]-8-|", views: profileImageView, statusTextView, statusImageView, likesCommentsLabel, dividerLineView, likeButton)
        addConstraintsWithFormat(format: "H:[v0]-8-|", views: moreOptionsButton)
        addConstraintsWithFormat(format: "V:|-8-[v0(20)]", views: moreOptionsButton)
        
    }
    private func setupNameLocationStatusAndProfileImage(){
        if let name = post?.name{
            
            let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
            
            if let city = post?.location?.city, let state = post?.location?.state{
            
            attributedText.append(NSAttributedString(string: "\n\(city), \(state) ∙ ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
            
            let attachment  = NSTextAttachment()
            attachment.image = UIImage(named: "small-globe")
            attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
            attributedText.append(NSAttributedString(attachment: attachment))
            }
            nameLabel.attributedText = attributedText
        }
        if let statusText = post?.statusText{
            statusTextView.text = statusText
        }
        if let profileImageName = post?.profileImageName{
            profileImageView.image = UIImage(named: profileImageName)
        }
        if let statusImage = post?.statusImageName {
            statusImageView.image = UIImage(named: statusImage)
        }
        if let likes = post?.numOfLikes{
            if let comments = post?.numOfComments{
                likesCommentsLabel.text = "\(likes) Likes  \(comments) Comments"
            }
        
        }
    }
}

