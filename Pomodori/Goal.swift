//
//  Goal.swift
//  Pomodori
//
//  Created by hallt4 on 5/12/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class Goal: NSObject, NSCoding {
    
    
    
    var title: String
    var goalQuantity: Int
    var completedQuantity: Int = 0
    
    init(title: String, goalQuantity: Int, completedQuantity: Int){
        self.title = title
        self.goalQuantity = goalQuantity
        self.completedQuantity = completedQuantity
        
        super.init()
    }
    
    //NSCoding protocol methods
    
    required convenience init?(coder decoder: NSCoder) {
        let title = decoder.decodeObjectForKey("title") as! String
        
        let goalQuantity = decoder.decodeObjectForKey("goalQuantity") as! Int
        
        let completedQuantity = decoder.decodeObjectForKey("completedQuantity") as! Int
        
        
        self.init(title: title, goalQuantity: goalQuantity, completedQuantity: completedQuantity)
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.goalQuantity, forKey: "goalQuantity")
        coder.encodeObject(self.completedQuantity, forKey: "completedQuantity")
    }

}
