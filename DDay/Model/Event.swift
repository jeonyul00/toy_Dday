//
//  Event.swift
//  DDay
//
//  Created by 전율 on 9/25/24.
//

import Foundation
import UIKit

struct Event {
    let date: Date
    let title: String
    let backgroundColor: UIColor
    let textColor: UIColor
    let icon: String
    
    var daysString: String? {
        guard let day = date.days(from: Date.today) else { return nil }
        
        if day >= 0 {
            return "D-\(abs(day))"
        }
        return "D+\(abs(day))"
    }
    
}
