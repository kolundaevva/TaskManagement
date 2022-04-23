//
//  Manager.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 19.04.2022.
//

import Foundation

class SupportManager {
    static var currentDay: Date = Date()
    static var currentWeek: [Date] = []
    
    static func fetchCurrentWeek() -> [Date] {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else { fatalError() }
        
        (1...7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekDay)
            }
        }
        
        return currentWeek
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
