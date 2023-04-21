//
//  SettingsView.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/22/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct SettingsView: View {
    @EnvironmentObject var info: BasicInfo
    @EnvironmentObject var dailyReminders: DailyReminderList
    @State private var dragging: DailyReminder?
    @AppStorage("dailyReminders") private var dailyRemindersData: Data = Data()
    @Binding var viewState: Int
    
    var body: some View {
        
        ZStack{
            VStack {
                VStack {
                    HStack {
                        Button {
                            info.view = .tab
                            let reminderStorage: DailyReminderListStorage = dailyReminders.GetJSON()
                            
                            guard let reminderData = try? JSONEncoder().encode(reminderStorage) else {return}
                            
                            dailyRemindersData = reminderData
                        } label: {
                            Text("Save")
                                .font(Font.headline.weight(.bold))
                        } .padding()
                        Spacer()
                    }
                    Text("Reminders")
                        .font(.largeTitle.bold())
                        .foregroundColor(.black)
                    
                }
                    .background(Rectangle()
                        .fill(Color.cyanColor)
                        .frame(width: 700,height: 700)
                    )
                Button("+") {
                    dailyReminders.reminders += [DailyReminder(name: "")]
                }.font(.largeTitle.bold())
                NavigationView {
                    List() {
                        ForEach($dailyReminders.reminders) { $reminder in
                            TextField("New Reminder", text: $reminder.name)
                                .foregroundColor(Color.darkBlue)
                                .font(Font.headline.weight(.bold))
                                .listRowBackground(Color.white)
                        }
                        .onMove(perform: move)
                        .onDelete(perform: delete)
                    }
                    .listStyle(.inset)
                    .colorMultiply(.cyanColor)
                    .navigationBarHidden(true)
                    }
                }
            }
        }
    
    func move(from source: IndexSet, to destination: Int) {
        dailyReminders.reminders.move(fromOffsets: source, toOffset: destination)
    }
    func delete(from source: IndexSet) {
        dailyReminders.reminders.remove(atOffsets: source)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(5))
    }
}
