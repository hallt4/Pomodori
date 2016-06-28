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
   
    
    @IBAction func saveGoalButtonTapped(sender: AnyObject) {
        if let titleText = titleTextField.text {
        goal?.title = titleText
        }
        
        dataSource.saveData()
                
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    @IBAction func cancelGoalButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        titleTextField.text = goal?.title
    
    }

    override func viewWillAppear(animated: Bool) {
        print(goal)
    }
            
}