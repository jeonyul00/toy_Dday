//
//  SortType.swift
//  DDay
//
//  Created by 전율 on 10/28/24.
//

import Foundation


enum SortType:Int {
    case futureFirst // 미래
    case pastFirst // 과거
    
    func toggle(){
        switch self {
        case .futureFirst:
            UserDefaults.standard.set(SortType.pastFirst.rawValue, forKey: "sortType")
        case .pastFirst:
            UserDefaults.standard.set(SortType.futureFirst.rawValue, forKey: "sortType")
        }
    }
}
