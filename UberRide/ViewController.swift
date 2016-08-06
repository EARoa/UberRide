//
//  ViewController.swift
//  UberRide
//
//  Created by Efrain Ayllon on 8/4/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @NSCopying var timeZone: NSTimeZone?
    
    var notificationDate :String!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var myDate: UILabel!
    
    override func viewDidLoad() {
        datePicker.hidden = false
        myDate.hidden = true

        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)    }
    
    func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateformatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let outputDate = dateformatter.stringFromDate(datePicker.date)

        myDate.text = outputDate
        notificationDate = outputDate
    }
    
    
    
    
    @IBAction func readyButtonisPressed() {
        
        datePicker.hidden = false
        myDate.hidden = true
        
        
    }
    
    @IBAction func readyButtonCompleted() {
        let notifaction = UILocalNotification()
        notifaction.alertTitle = "Your ride is here!"
        notifaction.alertBody = "Ride is here. Are you ready?"
        notifaction.alertAction = "Hello!"
        notifaction.fireDate = datePicker.date
        notifaction.category = "actionCategory"
        notifaction.userInfo = ["alarmDate":datePicker.date]
        UIApplication.sharedApplication().scheduleLocalNotification(notifaction)
        [AZNotification .showNotificationWithTitle("Congrats! Your Uber is on their way", controller: self, notificationType: AZNotificationType.Success)]
        [AZNotificationType.Success]
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}