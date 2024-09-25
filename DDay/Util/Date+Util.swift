//
//  Date+Util.swift
//  DDay
//
//  Created by 전율 on 9/23/24.
//

import Foundation


extension Date {
    
    static var today: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: .now)
    }
    
    init(year: Int, month: Int, day: Int, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        let calendar = Calendar.current
        let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        self = calendar.date(from: components) ?? Date(timeIntervalSinceReferenceDate: 0)
    }
    
    /// d-day
    func days(from date: Date) -> Int? {
        let calendar = Calendar.current
        let from = calendar.startOfDay(for: date)
        let to = calendar.startOfDay(for: self) // 왜 self를 전달하지? -> 호출한 객체의 현재 날짜.
        return calendar.dateComponents([.day], from: from, to: to).day
    }
    
    
}
