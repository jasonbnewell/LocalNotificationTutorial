//
//  ViewController.swift
//  LocalNotificationTutorial
//
//  Created by Jason Newell on 1/7/15.
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var secondsStepper: UIStepper!
    
    private var secondsToWait:Int! {
        didSet {
            secondsLabel.text = "\(secondsToWait) seconds"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondsToWait = Int(secondsStepper.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func secondStepperValueChanged(sender: UIStepper) {
        secondsToWait = Int(sender.value)
    }

    @IBAction func scheduleButtonPressed(sender: UIButton) {
        var localNotification = UILocalNotification()
        localNotification.alertBody = "This is a scheduled notification"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: NSTimeInterval(secondsToWait))
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
}

