//
//  Post.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 09/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit


class Post : NSObject{
    var name: String?
    var statusText: String?
    var profileImageName: String?
    var statusImageName: String?
    var numOfLikes: Int?
    var numOfComments: Int?
    var statusImageURL: String?
    
    var location: Location?
    
    override init(){
        super.init()
        location = Location()//instantiate object
    }
}
