//
//  ViewController.swift
//  LocalNotificationTutorial
//
//  Created by Jason Newell on 1/7/15.
//
//

import UIKit
import UserNotifications

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

    @IBAction func secondsStepperValueChanged(sender: UIStepper) {
        secondsToWait = Int(sender.value)
    }

    @IBAction func scheduleButtonPressed(withSender: UIButton) {
        let center = UNUserNotificationCenter.current()
        
        
        

//        localNotification.alertBody = "This is a scheduled notification" // setting the alertBody property so we can customize a text message that the alert shows
//        localNotification.fireDate = Date(timeIntervalSinceNow:TimeInterval(secondsToWait)) // setting the fireDate property to a future date
//        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
}

