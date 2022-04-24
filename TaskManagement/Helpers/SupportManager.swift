//
//  Manager.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 19.04.2022.
//

import Foundation

class SupportManager {
    static var currentDay: Date = Date()
    
    static func fetchCurrentWeek() -> [Date] {
        var calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = 2
        let today = calendar.startOfDay(for: Date())
        var week = [Date]()
        if let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) {
            for i in 0...6 {
                if let day = calendar.date(byAdding: .day, value: i, to: weekInterval.start) {
                    week += [day]
                }
            }
        }
        return week
    }
    
    static func extaractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    static func isCurrentDay(day: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(day, inSameDayAs: currentDay)
    }
    
    static func startOfTheDay() -> Date{
        let calendar = Calendar.current
        return calendar.startOfDay(for: currentDay)
    }
    
    static func endOfTheDay() -> Date {
        return startOfTheDay().addingTimeInterval(60*60*24 - 1)
    }
}
