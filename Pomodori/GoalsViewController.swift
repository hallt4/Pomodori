//
//  GoalsViewController.swift
//  Pomodori
//
//  Created by hallt4 on 5/11/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var goalDataSource = GoalDataSource.sharedManager
    var indexPathForEditingRow: NSIndexPath?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalDataSource.allGoals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Create an instance of UITableViewCell
        
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        
        //Set the cell text to the goal title at this index
        
        let goal = goalDataSource.allGoals[indexPath.row]
        
        cell.textLabel?.text = goal.title
        cell.detailTextLabel?.text = "\(goal.completedQuantity) / \(goal.goalQuantity)"
        
        return cell
    }
    
    //Swipe to Edit/Delete
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Edit") { (action, indexPath) in
            self.indexPathForEditingRow = indexPath
            self.performSegueWithIdentifier("ToEditGoalVC", sender: self)
            
        }
        
        editAction.backgroundColor = UIColor.greenColor()
        
        return [editAction]
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToEditGoalVC" {
            guard let destinationVC = segue.destinationViewController as? EditGoalViewController else {return}
            guard let indexPath = self.indexPathForEditingRow else {return}
            
            destinationVC.goal = self.goalDataSource.allGoals[indexPath.row]
            
            
            
        }
    }
    
}
