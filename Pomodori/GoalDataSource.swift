//
//  GoalDataSource.swift
//  Pomodori
//
//  Created by hallt4 on 5/12/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class GoalDataSource {
    
    static let sharedManager = GoalDataSource()
    
    var allGoals = [Goal]()
    
    let goalsKey = "goalsKey"
    
    func createNewGoal(title: String, goalQuantity: Int, completedQuantity: Int) ->  Goal {
        
        let newGoal = Goal(title: title, goalQuantity: goalQuantity, completedQuantity: completedQuantity)
        
        allGoals.append(newGoal)
        
        return newGoal
        
    }
    
    init() {
        loadData()
        
    }
    
    func saveData() {
        
        
        
        let data = NSKeyedArchiver.archivedDataWithRootObject(allGoals)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: goalsKey)
        
    }
    
    func loadData() {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(goalsKey) as? NSData {
            if let allGoalsArray = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Goal] {
                allGoals = allGoalsArray
            } else {
                allGoals = []
            }
        }
    }
    
}
