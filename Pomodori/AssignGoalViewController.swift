//
//  AssignGoalViewController.swift
//  Pomodori
//
//  Created by hallt4 on 5/16/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class AssignGoalViewController: UIViewController {
    
    @IBAction func saveGoalButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
     
    }
    
    
    @IBAction func cancelGoalButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
