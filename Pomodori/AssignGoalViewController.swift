//
//  AssignGoalViewController.swift
//  Pomodori
//
//  Created by hallt4 on 5/16/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class AssignGoalViewController: UIViewController {
    
    let dataSource = GoalDataSource.sharedManager
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var totalGoalTextField: UITextField!
    @IBAction func saveGoalButtonTapped(sender: AnyObject) {
        
        if let titleText = titleTextField.text {
          
            if let newTotalGoal = Int(totalGoalTextField.text!) {
                dataSource.createNewGoal(titleText, goalQuantity: newTotalGoal, completedQuantity: 0)
            }
        }
        
        dataSource.saveData()
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func cancelGoalButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
