//
//  FirstViewController.swift
//  Pomodori
//
//  Created by hallt4 on 5/11/16.
//  Copyright © 2016 Tyler Hall. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIGestureRecognizerDelegate {
    

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: NSTimer!
    
    var minuteLabel = 1
    
    var secondLabel = 0
    
    var timerIsRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
        self.view.addGestureRecognizer(longPressGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTap(sender: UITapGestureRecognizer) {
        
        if (timerIsRunning == false) {
            startTimer()
        } else {
            stopTimer()
        }
        
    }
    
    func didLongPress(sender: UILongPressGestureRecognizer) {
        
        if (sender.state == .Began && timerIsRunning == false){
        resetTimer()
        } else if(timerIsRunning == true){
            stopTimer()
        }
    }
    
    func startTimer() {
        
        timerIsRunning = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
        
        
        
    }
    
    func stopTimer() {
        timerIsRunning = false
        timer.invalidate()
    
    }
    
    func resetTimer() {
        timer.invalidate()
        timerIsRunning = false
        }
    
    func resetTimerLabel() {
        minuteLabel = 25
        secondLabel = 0
        self.timerLabel.text = "\(minuteLabel):0\(secondLabel)"
        

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let assignPomodoroViewController = segue.destinationViewController as? AssignPomodoroViewController else {
            return
        }
        assignPomodoroViewController.completionClosure = { [weak self] () in
            self?.resetTimerLabel()
            
        }
    }
    
    
    func tickDown() {
        
        if (minuteLabel == 0 && secondLabel == 0){
            //segue to AssignPomodoroVC
            self.timerLabel.text = "00:00"
            
            resetTimer()
            
            self.performSegueWithIdentifier("ToAssignPomodoroVC", sender: self)
            
            
        } else if (secondLabel == 0){
            
            secondLabel = 59
            minuteLabel -= 1
            
            if(minuteLabel > 9 && secondLabel > 9){
                self.timerLabel.text = "\(minuteLabel):\(secondLabel)"
            } else if(minuteLabel > 9 && secondLabel <= 9){
                self.timerLabel.text = "\(minuteLabel):0\(secondLabel)"
            } else if(minuteLabel <= 9 && secondLabel > 9){
                self.timerLabel.text = "0\(minuteLabel):\(secondLabel)"
            } else if(minuteLabel <= 9 && secondLabel <= 9){
                self.timerLabel.text = "0\(minuteLabel):0\(secondLabel)"
            }
            
        } else {
            
            secondLabel -= 1
            
            if(minuteLabel > 9 && secondLabel > 9){
                self.timerLabel.text = "\(minuteLabel):\(secondLabel)"
            } else if(minuteLabel > 9 && secondLabel <= 9){
                self.timerLabel.text = "\(minuteLabel):0\(secondLabel)"
            } else if(minuteLabel <= 9 && secondLabel > 9){
                self.timerLabel.text = "0\(minuteLabel):\(secondLabel)"
            } else if(minuteLabel <= 9 && secondLabel <= 9){
                self.timerLabel.text = "0\(minuteLabel):0\(secondLabel)"
            }

        
        }
        
    }

}

