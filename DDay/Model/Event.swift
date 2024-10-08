//
//  Event.swift
//  DDay
//
//  Created by 전율 on 9/25/24.
//

import Foundation
import UIKit

struct Event {
    enum Category: String, CaseIterable {
        case birthday
        case briefcase
        case diet
        case wedding
        case travel
        case exam
        case soccer
        case baseball
        case basketball
        
        var title: String {
            switch self {
            case .birthday:
                return "생일"
            case .briefcase:
                return "업무"
            case .diet:
                return "다이어트"
            case .wedding:
                return "결혼"
            case .travel:
                return "여행"
            case .exam:
                return "시험"
            case .soccer:
                return "축구"
            case .baseball:
                return "야구"
            case .basketball:
                return "농구"
            }
        }
    }
    
    
    let date: Date
    let title: String
    let backgroundColor: UIColor
    let textColor: UIColor
    let icon: String
    let daysString: String?
    let dateString: String?
    let iconImage:UIImage?
    
    init(date: Date, title: String, backgroundColor: UIColor, textColor: UIColor, icon: String) {
        self.date = date
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.icon = icon
        
        if let day = date.days(from: Date.today) {
            if day >= 0 {
                daysString = "D-\(abs(day))"
            } else {
                daysString = "D+\(abs(day))"
            }
        } else {
            daysString = nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        dateString = formatter.string(from: date)
        iconImage = UIImage(named: icon)
    }
    
    init(data: ComposeData) {
        self.init(date: data.date!, title: data.title!, backgroundColor: data.backgroundColor!, textColor: data.textColor!, icon: data.category!.rawValue)
    }
    
}

/// 더미 데이터
var events = [
    Event(date: Date(year: 2002, month: 5, day: 31), title: "한일 월드컵", backgroundColor: .orange, textColor: .white, icon: "soccer"),
    Event(date: Date(year: 2022, month: 11, day: 20), title: "카타르 월드컵", backgroundColor: .yellow, textColor: .white, icon: "soccer"),
    Event(date: Date(year: 2026, month: 6, day: 11), title: "북중미 월드컵", backgroundColor: .brown, textColor: .white, icon: "soccer"),
]

