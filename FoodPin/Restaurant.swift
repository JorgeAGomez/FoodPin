//
//  Restaurant.swift
//  FoodPin
//
//  Created by Jorge Gomez on 2015-06-15.
//  Copyright (c) 2015 Jorge Gomez. All rights reserved.
//

import Foundation

class Restaurant {

    var name : String = ""
    var location : String = ""
    var phone : String = ""
    var type : String = ""
    var image : String = ""
    var isVisited : Bool = false
    
    init (name:String, location:String, phone:String, type:String, image:String, isVisited:Bool){
        self.name = name
        self.location = location
        self.phone = phone
        self.type = type
        self.image = image
        self.isVisited = isVisited
    
    }
}