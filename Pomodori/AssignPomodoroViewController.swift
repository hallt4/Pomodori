//
//  AssignPomodoroViewController.swift
//  Pomodori
//
//  Created by hallt4 on 5/12/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class AssignPomodoroViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var completionClosure: (() -> Void)?
    
    override func viewDidAppear(animated: Bool) {
    
        super.viewDidAppear(animated)
        if let closure = self.completionClosure{
            closure()
        }
    }
    
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
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Add") { (action, indexPath) in
            self.indexPathForEditingRow = indexPath
            self.goalDataSource.allGoals[indexPath.row].completedQuantity += 1
            self.goalDataSource.saveData()
            self.tableView.reloadData()
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()){
                    self.navigationController?.popViewControllerAnimated(true)
            }

        }
        
        editAction.backgroundColor = UIColor.greenColor()
        
        return [editAction]
    }

    
}


