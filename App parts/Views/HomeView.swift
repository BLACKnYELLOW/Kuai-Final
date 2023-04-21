//
//  HomeView.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/22/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var dailyReminders: DailyReminderList
    @State var listDone: Bool = false
    @AppStorage("dailyReminders") private var dailyRemindersData: Data = Data()
    
    
    //Bad Refresh
    @Binding var viewState: Int
    @Binding var badRefresh: Bool
    
    
    
    var body: some View {
                        VStack {
                            ForEach(dailyReminders.reminders) { reminder in
                                CheckableReminderView(dailyReminder: reminder)
                                    .onTapGesture {
                                        reminder.checked.toggle()
                                        dailyReminders.Completed()
                                        
                                        let reminderStorage: DailyReminderListStorage = dailyReminders.GetJSON()
                                        
                                        guard let reminderData = try? JSONEncoder().encode(reminderStorage) else {return}
                                        
                                        dailyRemindersData = reminderData
                                    }
                                    .padding([.leading,.trailing])
                            }
                            .foregroundColor(Color.black)
                            Text(dailyReminders.complete ? "yey" : "you can do it!")
                                .padding()
                            Spacer()
                        } .background(Rectangle()
                            .fill(Color.cyanColor)
                            .frame(width: 700,height: 1000)
                        )
                    }
        }
        
        
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewState: Binding.constant(3), badRefresh: Binding.constant(false))
    }
}
