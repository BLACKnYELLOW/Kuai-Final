//
//  ReminderClasses.swift
//  Kuai
//
//  Created by Asher Polsky (student LM) on 3/8/23.
//

import Foundation



class DailyReminder: Identifiable, ObservableObject, Equatable {
    static func == (lhs: DailyReminder, rhs: DailyReminder) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    @Published var name: String
    @Published var checked: Bool
    var id: UUID
    
    init(name: String = "Example", checked: Bool = false) {
        self.name = name
        self.checked = checked
        id = UUID()
    }
}


class DailyReminderList: Identifiable, ObservableObject {
    @Published var reminders : [DailyReminder]
    @Published var complete : Bool
    var id: UUID
    
    init() {
        id = UUID()
        self.complete = false
        self.reminders = []
        self.reminders += [DailyReminder(name: "Example"),DailyReminder(name: "Example2"),DailyReminder(name: "Example3")]
    }
    
    func Completed() {
        var check = true
        for reminder in reminders {
            if reminder.checked == false {
                check = false
            }
        }
        complete = check
    }
    
    func GetJSON() -> DailyReminderListStorage {
        var reminderArray: [DailyReminderStorage] = []
        for reminder in reminders {
            reminderArray += [DailyReminderStorage(name: reminder.name, checked: reminder.checked)]
        }
        return DailyReminderListStorage(reminders: reminderArray, complete: self.complete)
    }
    
    func UploadJSON(data: DailyReminderListStorage) {
        self.complete = data.complete
        var reminderBuffer : [DailyReminder] = []
        for r in data.reminders {
            reminderBuffer += [DailyReminder(name: r.name, checked: r.checked)]
        }
        reminders = reminderBuffer
    }
}

class WeeklyReminder: ObservableObject, Identifiable {
    @Published var name: String
    var id: UUID
    
    init(name: String = "Example") {
        self.name = name
        id = UUID()
    }
}

class WeeklyReminderList: ObservableObject, Identifiable {
    @Published var sundayReminders : [WeeklyReminder]
    @Published var mondayReminders : [WeeklyReminder]
    @Published var tuesdayReminders : [WeeklyReminder]
    @Published var wednesdayReminders : [WeeklyReminder]
    @Published var thursdayReminders : [WeeklyReminder]
    @Published var fridayReminders : [WeeklyReminder]
    @Published var saturdayReminders : [WeeklyReminder]
    var id: UUID
    
    init() {
        self.sundayReminders = []
        self.mondayReminders = []
        self.tuesdayReminders = []
        self.wednesdayReminders = []
        self.thursdayReminders = []
        self.fridayReminders = []
        self.saturdayReminders = []
        id = UUID()
    }
    
    func GetJSON() -> WeeklyReminderListStorage {
        var sunday: [WeeklyReminderStorage] = []
        for i in sundayReminders {
            sunday += [WeeklyReminderStorage(name: i.name)]
        }
        var monday: [WeeklyReminderStorage] = []
        for i in sundayReminders {
            monday += [WeeklyReminderStorage(name: i.name)]
        }
        var tuesday: [WeeklyReminderStorage] = []
        for i in sundayReminders {
            tuesday += [WeeklyReminderStorage(name: i.name)]
        }
        var wednesday: [WeeklyReminderStorage] = []
        for i in sundayReminders {
            wednesday += [WeeklyReminderStorage(name: i.name)]
        }
        var thursday: [WeeklyReminderStorage] = []
        for i in sundayReminders {
            thursday += [WeeklyReminderStorage(name: i.name)]
        }
        var friday: [WeeklyReminderStorage] = []
        for i in sundayReminders {
            friday += [WeeklyReminderStorage(name: i.name)]
        }
        var saturday: [WeeklyReminderStorage] = []
        for i in sundayReminders {
            saturday += [WeeklyReminderStorage(name: i.name)]
        }
        
        return WeeklyReminderListStorage(sundayReminders: sunday, mondayReminders: monday, tuesdayReminders: tuesday, wednesdayReminders: wednesday, thursdayReminders: thursday, fridayReminders: friday, saturdayReminders: saturday)
    }
    
    func UploadJSON(data: WeeklyReminderListStorage) {
        var buffer : [WeeklyReminder] = []
        for r in data.sundayReminders {
            buffer += [WeeklyReminder(name: r.name)]
        }
        sundayReminders = buffer
        
        buffer = []
        for r in data.mondayReminders {
            buffer += [WeeklyReminder(name: r.name)]
        }
        mondayReminders = buffer
        
        buffer = []
        for r in data.tuesdayReminders {
            buffer += [WeeklyReminder(name: r.name)]
        }
        tuesdayReminders = buffer
        
        buffer = []
        for r in data.wednesdayReminders {
            buffer += [WeeklyReminder(name: r.name)]
        }
        wednesdayReminders = buffer
        
        buffer = []
        for r in data.thursdayReminders {
            buffer += [WeeklyReminder(name: r.name)]
        }
        thursdayReminders = buffer
        
        buffer = []
        for r in data.fridayReminders {
            buffer += [WeeklyReminder(name: r.name)]
        }
        fridayReminders = buffer
        
        buffer = []
        for r in data.saturdayReminders {
            buffer += [WeeklyReminder(name: r.name)]
        }
        saturdayReminders = buffer
    }
    
}

class OnceReminder: ObservableObject, Identifiable, Equatable {
    static func == (lhs: OnceReminder, rhs: OnceReminder) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    @Published var name: String
    @Published var day: Int
    @Published var month: Int
    @Published var year: Int
    @Published var today: Bool
    var id: UUID
    
    init(name: String = "Example", day: Int = 1, month: Int = 1, year: Int = 2024) {
        self.name = name
        self.day = day
        self.month = month
        self.year = year
        self.today = false
        id = UUID()
    }
}


class OnceReminderList: ObservableObject, Identifiable {
    @Published var reminders : [OnceReminder]
    var id: UUID
    
    init() {
        id = UUID()
        self.reminders = []
        self.reminders += [OnceReminder(name: "Example")]
    }
    
    func OnNewDay() {
        
    }
}
