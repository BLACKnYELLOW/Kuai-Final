//
//  App_partsApp.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/21/23.
//

import SwiftUI

@main
struct App_partsApp: App {
    
    private var delegate: NotificationDelegate = NotificationDelegate()
    
    init() {
        let center = UNUserNotificationCenter.current()
        center.delegate = delegate
        center.requestAuthorization(options: [.alert, .sound, .badge]) { result, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    @StateObject var dailyReminders: DailyReminderList = DailyReminderList()
    @StateObject var weeklyReminders: WeeklyReminderList = WeeklyReminderList()
    @StateObject var onceReminders: OnceReminderList = OnceReminderList()
    @StateObject var info: BasicInfo = BasicInfo(view: .tab)
    @AppStorage("dailyReminders") private var dailyRemindersData: Data = Data()
    @AppStorage("onceReminders") private var onceRemindersData: Data = Data()
    @AppStorage("weeklyReminders") private var weeklyRemindersData: Data = Data()
    @StateObject var dateHolder: DateHolder = DateHolder()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateHolder)
                .environmentObject(dailyReminders)
                .environmentObject(weeklyReminders)
                .environmentObject(onceReminders)
                .environmentObject(info)
                .task {
                    guard let dailyR = try? JSONDecoder().decode(DailyReminderListStorage.self, from: dailyRemindersData) else {return}
                    dailyReminders.UploadJSON(data: dailyR)
                    
                    guard let weeklyR = try? JSONDecoder().decode(WeeklyReminderListStorage.self, from: weeklyRemindersData) else {return}
                    weeklyReminders.UploadJSON(data: weeklyR)
                }
        }
    }
}
