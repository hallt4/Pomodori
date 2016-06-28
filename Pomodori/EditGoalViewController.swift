//
//  EditGoalViewController.swift
//  Pomodori
//
//  Created by hallt4 on 5/12/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class EditGoalViewController: UIViewController {
    
    var goal: Goal?
    
    let dataSource = GoalDataSource.sharedManager
    
    
    
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var completedGoalTextField: UITextField!
    
    @IBOutlet weak var totalGoalTextField: UITextField!
    
    
    @IBAction func saveGoalButtonTapped(sender: AnyObject) {
        if let titleText = titleTextField.text {
            goal?.title = titleText
            
            
            if let newCompletedTotal = Int(completedGoalTextField.text!) {
                goal?.completedQuantity = newCompletedTotal
                
                
                if let newTotalGoal = Int(totalGoalTextField.text!) {
                    goal?.goalQuantity = newTotalGoal
                    
                    
                    dataSource.saveData()
                }
            }
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    @IBAction func cancelGoalButtonTapped(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    override func viewDidLoad() {
        
        titleTextField.text = goal?.title
        
        completedGoalTextField.text = "\(goal!.completedQuantity)"
        totalGoalTextField.text = "\(goal!.goalQuantity)"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        print(goal)
    }
    
}