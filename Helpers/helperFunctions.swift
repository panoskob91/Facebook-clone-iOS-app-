//
//  helperFunctions.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 09/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit
import Foundation




func parseJSONSPost(localJSONFile: String) -> [[String:Any]] {
   
    var JSONArrayOfDictionaries: [[String:Any]] = [[:]]
    
    if let path = Bundle.main.path(forResource: localJSONFile, ofType: "json"){
        
        do{
            let data = try(Data(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe))
            
            
            let jsonDictionary = try(JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as? [String : Any]
            
            if let postDictionary = jsonDictionary!["posts"] as? [[String:AnyObject]]{
                
                JSONArrayOfDictionaries = postDictionary
                
            }
        }catch{
            print(error)
        }
    }
            
            
    
         return JSONArrayOfDictionaries
            
}
