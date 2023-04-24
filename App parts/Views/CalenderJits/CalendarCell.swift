//
//  CalendarCell.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 4/17/23.
//

import SwiftUI



struct CalendarCell: View {

    

    @EnvironmentObject var dateHolder: DateHolder

    @State var showSheet = false

    @Binding var viewState: Int

    let count: Int

    let startingSpaces: Int

    let daysInMonth: Int

    let daysInPreviousMonth: Int

    let date = Date()

    let formatter = DateFormatter()

    

    

    var body: some View {

        

        Button {

            showSheet = true

        } label: {

            if (CalendarHelper().monthYearInt(dateHolder.date) == getMonth() && monthStruct().day() == getDay()) {

                Text(monthStruct().day())

                    .foregroundColor(Color.darkBlue)

                    .frame(maxWidth: .infinity, maxHeight: 100)
                
                    .font(Font.headline.weight(.bold))

            }

            else {

                Text(monthStruct().day())

                    .foregroundColor(textColor(type: monthStruct().monthType))

                    .frame(maxWidth: .infinity, maxHeight: 100)
                
                    .font(Font.headline.weight(.bold))

            }

        } .sheet(isPresented: $showSheet) {

            if (CalendarHelper().monthYearInt(dateHolder.date) == getMonth() && monthStruct().day() == getDay()) {

                Text("Today is today")

                Text("The time is \(getHour()): \(getMinute())")
                
                Text("VOTE FOR KUAI!")
                    .font(.system(size: 30))
                
                    .padding()
            

            }

            else {

                Text("Today is not today")
                
                Text("VOTE FOR KUAI!")
                    .font(.system(size: 30))
                
                    .padding()
                

            }

            

            Button("Click here to make a reminder") {

                viewState = 5

            }

        }

    }

    

    func getDay() -> String {

        formatter.dateFormat = "dd"

        let day = formatter.string(from: date)

        return day

    }

    

    func getMonth() -> String {

        formatter.dateFormat = "MM"

        let month = formatter.string(from: date)

        return month

    }



    func getHour() -> String {

        formatter.dateFormat = "hh"

        let hour = formatter.string(from: date)

        return hour

    }

    

    func getMinute() -> String {

        formatter.dateFormat = "mm"

        let minute = formatter.string(from: date)

        return minute

    }

    

    func textColor(type: MonthType) -> Color {

        return type == MonthType.Current ? Color.black : Color.gray

    }

    

    func monthStruct() -> MonthStruct {

        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces

        

        if (count <= start) {

            let day = daysInPreviousMonth + count - start

            return MonthStruct(monthType: MonthType.Previous, dayInt: day)

        }

        else if (count - start > daysInMonth) {

            let day = count - start - daysInMonth

            return MonthStruct(monthType: MonthType.Next, dayInt: day)

        }

        

        let day = count - start

        return MonthStruct(monthType: MonthType.Current, dayInt: day)

    }

}



struct CalendarCell_Previews: PreviewProvider {

    static var previews: some View {

        CalendarCell(viewState: Binding.constant(2), count: 1, startingSpaces: 1, daysInMonth: 1, daysInPreviousMonth: 1)

    }

}
