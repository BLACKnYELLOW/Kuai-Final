//
//  CheckableReminderView.swift
//  Kuai
//
//  Created by Asher Polsky (student LM) on 3/16/23.
//

import SwiftUI

struct CheckableReminderView: View {
    @ObservedObject var dailyReminder: DailyReminder
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(dailyReminder.checked ? Color.green : Color.red)
            HStack {
                Image(systemName: (dailyReminder.checked ? "checkmark.circle.fill" : "circle"))
                Text(dailyReminder.name)
                    .foregroundColor(Color.black)
                
                Spacer()
            }
        }
    }
}

struct CheckableReminderView_Previews: PreviewProvider {
    static var previews: some View {
        CheckableReminderView(dailyReminder: DailyReminder())
    }
}
