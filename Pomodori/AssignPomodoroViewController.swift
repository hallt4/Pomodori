//
//  AssignPomodoroViewController.swift
//  Pomodori
//
//  Created by hallt4 on 5/12/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class AssignPomodoroViewController: UIViewController {
    var completionClosure: (() -> Void)?
    
    override func viewDidAppear(animated: Bool) {
    
        super.viewDidAppear(animated)
        if let closure = self.completionClosure{
            closure()
        }
    }
}
