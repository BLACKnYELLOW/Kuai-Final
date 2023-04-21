//
//  AlarmView.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/22/23.
//

import SwiftUI



struct AlarmView: View {
    
    @State var isDark = false
    
    @State var isOn = false
    
    var body: some View {
        
        
        
        NavigationView{
            
            Home(isDark: $isDark, isOn: $isOn, alarmSet: false)
            
                .navigationBarHidden(true)
            
                .preferredColorScheme(isDark ? .dark : .light)
            
            
            
        }
        
    }
    
}



struct AlarmView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AlarmView()
        
    }
    
}



enum NotificationAction: String {
    
    
    
    case dismiss
    
    
    
    case reminder
    
    
    
}







enum NotificationCategory: String {
    
    
    
    case general
    
    
    
}



class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    
    
    
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
        
        
        
        
        
        let userInfo = response.notification.request.content.userInfo
        
        
        
        print(userInfo)
        
        
        
        
        
        
        
        completionHandler()
        
        
        
    }
    
    
    
    
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent response: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        
        
        completionHandler([.banner, .sound])
        
        
        
    }
    
    
    
}









struct Home : View {
    
    @State var birthDate = Date.now
    
    @Binding var isDark : Bool
    
    @Binding var isOn : Bool
    
    var width = UIScreen.main.bounds.width
    
    @State var current_Time = Time(min:0, sec:0, hour: 0)
    
    @State var receiver = Timer.publish(every: 1, on: .current, in:. default).autoconnect()
    
    @State var alarmhour: String = ""
    
    @State var alarmminute: String = ""
    
    @State var currentDate = Date()
    
    @State private var date2 = Date()
    
    @State var alarmSet: Bool 
    
    
    weak var datePicker: UIDatePicker!
    
    
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    
    let formatter = DateFormatter()
    
    var body : some View{
        
        
        
        VStack{
            
            HStack{
                
                Text("Alarm Clock")
                
                    .font(.title)
                
                    .fontWeight(.heavy)
                
                
                
                Spacer(minLength: 0)
                
                
                
                
                
                
                
                Button(action: {isDark.toggle()}) {
                    
                    Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                    
                        .font(.system(size: 22))
                    
                        .foregroundColor(isDark ? .black : .white)
                    
                        .padding()
                    
                        .background(Color.primary)
                    
                        .clipShape(Circle())
                    
                }
                
            }
            
            .padding()
            
            
            
            Spacer(minLength: 0)
            
            
            
            
            
            ZStack{
                
                Circle()
                
                    .fill(Color.gray.opacity(0.1))
                
                
                
                
                
                
                
                ForEach(0..<60,id: \.self){i in
                    
                    
                    
                    Rectangle()
                    
                        .fill(Color.primary)
                    
                        .frame(width:2, height: (i%5) == 0 ? 15 : 5)
                    
                        .offset(y: (width-110) / 2)
                    
                        .rotationEffect(.init(degrees:Double(i) * 6))
                    
                }
                
                //second
                
                Rectangle()
                
                    .fill(Color.primary)
                
                    .frame(width:2, height: (width - 180) / 2)
                
                    .offset(y: -(width - 180) / 4)
                
                    .rotationEffect(.init(degrees:Double(current_Time.sec) * 6))
                
                //minute
                
                Rectangle()
                
                    .fill(Color.primary)
                
                    .frame(width:4, height: (width - 200) / 2)
                
                    .offset(y: -(width - 200) / 4)
                
                    .rotationEffect(.init(degrees:Double(current_Time.min) * 6))
                
                
                
                
                
                //hour
                
                Rectangle()
                
                    .fill(Color.primary)
                
                    .frame(width:4.5, height: (width - 240) / 2)
                
                    .offset(y: -(width - 240) / 4)
                
                    .rotationEffect(.init(degrees:Double(current_Time.hour) * 30))
                
                
                
                
                
                //center circle
                
                Circle()
                
                    .fill(Color.primary)
                
                    .frame(width: 15, height:15 )
                
                
                
                
                
                
                
            }
            
            .frame(width: width - 80, height: width - 80)
            
            
            
            Spacer()
            
            VStack {
                
                HStack{
                    
                    Spacer()
                   
                    
                    DatePicker("Alarm Time:", selection: $date2, displayedComponents: .hourAndMinute)
                        .padding()
                
                    
                    Button {
                        
                        let content = UNMutableNotificationContent()
                        
                        content.title = "Ding Ding Ding"
                        
                        content.subtitle = "Wake up now!"
                        
                        content.sound = UNNotificationSound.default
                        
                        
                        
                        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date2)
                        
                        
                        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                        
                        
                        
                        var dateComponents = DateComponents()
                        
                        dateComponents.hour = current_Time.hour
                        
                        dateComponents.minute = current_Time.min
     
                        
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        
                        
                        UNUserNotificationCenter.current().add(request)
                        
                        alarmSet = true
                        
                        
                    } label: {
                        
                        Text("Set Alarm")
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                    
                    Spacer()
                    
                }
                
                if (alarmSet == true) {
                    HStack {
                        Text("Alarm set for \(formattedDate(date: date2))")
                            .padding()
                        Button("Remove Alarm") {
                            alarmSet = false
                        }
                    }
                }
            }
            
            
            
            
            
            
            Spacer(minLength: 0)
            
        }
        
        
        
        .onAppear(perform: {
            
            let calendar = Calendar.current
            
            
            
            let min = calendar.component(.minute, from: Date())
            
            let sec = calendar.component(.second, from: Date())
            
            let hour = calendar.component(.hour, from: Date())
            
            
            
            withAnimation(Animation.linear(duration: 0.01)){
                
                self.current_Time = Time(min: min, sec: sec, hour: hour)
                
                
                
            }
            
        })
        
        .onReceive(receiver) { (_) in
            
            
            
            let calendar = Calendar.current
            
            
            
            let min = calendar.component(.minute, from: Date())
            
            let sec = calendar.component(.second, from: Date())
            
            let hour = calendar.component(.hour, from: Date())
            
            
            
            
            
            
            
            withAnimation(Animation.linear(duration: 0.01)){
                
                self.current_Time = Time(min: min, sec: sec, hour: hour)
                
            }
            
            
            
        }
        
    }
    
    
    
    func getHour() -> Int {
        
        let timeInterval = currentDate.timeIntervalSince1970
        
        let hour = Int(timeInterval)
        
        return hour
        
    }
    
    
    
    func formattedDate(date: Date) -> String{
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm"
        
        return formatter.string(from:date2)
        
    }
    
    
    
}





struct Time {
    
    var min : Int
    
    var sec : Int
    
    var hour : Int
    
}
