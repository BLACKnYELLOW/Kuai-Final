//
//  Codables.swift
//  Kuai
//
//  Created by Asher Polsky (student LM) on 3/17/23.
//

import Foundation

struct DailyReminderListStorage : Codable {
    let reminders : [DailyReminderStorage]
    let complete : Bool
}

struct DailyReminderStorage : Codable {
    let name : String
    let checked: Bool
}


struct WeeklyReminderListStorage : Codable {
    let sundayReminders : [WeeklyReminderStorage]
    let mondayReminders : [WeeklyReminderStorage]
    let tuesdayReminders : [WeeklyReminderStorage]
    let wednesdayReminders : [WeeklyReminderStorage]
    let thursdayReminders : [WeeklyReminderStorage]
    let fridayReminders : [WeeklyReminderStorage]
    let saturdayReminders : [WeeklyReminderStorage]
}

struct WeeklyReminderStorage : Codable {
    let name : String
}
