//
//  DateSelectionViewController.swift
//  DDay
//
//  Created by 전율 on 9/26/24.
//

import UIKit

class DateSelectionViewController: UIViewController {
    
    var data: ComposeData?
    
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateSelected(datePicker)
    }
    
    @IBAction func dateSelected(_ sender: UIDatePicker) {
        if let day = sender.date.days(from: Date.today) {
            if day >= 0 {
                daysLabel.text = "D-\(abs(day))"
            } else {
                daysLabel.text = "D+\(abs(day))"
            }
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        selectedDateLabel.text = formatter.string(from: sender.date)
    }
    
    @IBAction func toggleCalendarMode(_ sender: UIBarButtonItem) {
        if datePicker.datePickerStyle == .inline {
            datePicker.preferredDatePickerStyle = .wheels
            sender.image = UIImage(systemName: "calendar")
        } else {
            datePicker.preferredDatePickerStyle = .inline
            sender.image = UIImage(systemName: "line.3.horizontal.decrease.circle")
        }
    }
    
}
