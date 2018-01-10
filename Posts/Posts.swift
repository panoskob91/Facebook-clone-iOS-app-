//
//  Posts.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 03/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit


class Posts{
    
    //private var postList: [Post]
    var postList: [Post]
    
    init() {
        
        postList = [Post]()
        
                let postDictionary = parseJSONSPost(localJSONFile: "all_posts")
     
        for index in postDictionary{
            let post = Post()
            
            post.name = index["name"]! as? String
            post.statusText = index["statusText"]! as? String
            post.profileImageName = index["profileImageName"]! as? String
            post.statusImageName = index["statusImageName"]! as? String
            post.numOfLikes = index["numLikes"]! as? Int
            post.numOfComments = index["numComments"]! as? Int
            
            if let location = index["location"] as? [String:Any]{
                post.location?.city = location["city"]! as? String
                post.location?.state = location["state"]! as? String
            }
            
            
            postList.append(post)

        }
        
        
    
    }
}
