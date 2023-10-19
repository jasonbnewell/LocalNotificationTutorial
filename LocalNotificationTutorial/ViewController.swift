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
    
    private var secondsToWait:TimeInterval! {
        didSet {
            secondsLabel.text = "\(secondsToWait!) seconds"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondsToWait = Double(secondsStepper.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func secondsValueChanged(sender: UIStepper) {
        secondsToWait = TimeInterval(sender.value)
    }

    @IBAction func schedulePress(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "!"
//        content.attachments = UNNotificationAtt
        content.body = "hello"
        content.categoryIdentifier = "reminder"
        
        // TODO: Compile time check
        content.sound = .default
        content.userInfo = ["some": "info"]
   
        

        let wait = TimeInterval(secondsToWait)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(secondsToWait), repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger:trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
        
        

//        localNotification.alertBody = "This is a scheduled notification" // setting the alertBody property so we can customize a text message that the alert shows
//        localNotification.fireDate = Date(timeIntervalSinceNow:TimeInterval(secondsToWait)) // setting the fireDate property to a future date
//        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
}

