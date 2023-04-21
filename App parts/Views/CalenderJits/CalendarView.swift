//
//  CalendarView.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 4/17/23.
//

import SwiftUI


struct CalendarView: View {

    

    @EnvironmentObject var dateHolder: DateHolder

    @Binding var viewState: Int

    var body: some View {

        

        VStack(spacing: 1) {

            DateScrollerView()

                .environmentObject(dateHolder)

                .padding()

            dayOfWeekStack

            CalendarGrid

        }

    }

    

    var dayOfWeekStack: some View {

        

        HStack(spacing: 1) {

            

            Text("Sun").dayOfWeek()

            Text("Mon").dayOfWeek()

            Text("Tue").dayOfWeek()

            Text("Wed").dayOfWeek()

            Text("Thu").dayOfWeek()

            Text("Fri").dayOfWeek()

            Text("Sat").dayOfWeek()

            

        }

    }

    

    var CalendarGrid: some View {

        

        VStack(spacing: 1) {

            

            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)

            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)

            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)

            let previousMonth = CalendarHelper().minusMonth(dateHolder.date)

            let daysInPreviousMonth = CalendarHelper().daysInMonth(previousMonth)

            

            ForEach(0..<6) {

                

                row in

                HStack(spacing: 1) {

                    

                    ForEach(1..<8) {

                        

                        column in

                        let count = column + (row * 7)

                        CalendarCell(viewState: $viewState, count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPreviousMonth: daysInPreviousMonth)

                            .environmentObject(dateHolder)

                        

                        

                    }

                }

            }

        }

        .frame(maxHeight: .infinity)

    }

}





struct CalendarView_Previews: PreviewProvider {

    static var previews: some View {

        CalendarView(viewState: Binding.constant(2))

    }

}





extension Text {

    func dayOfWeek() -> some View {

        

        self.frame(maxWidth: .infinity)

            .padding(.top, 1)

            .lineLimit(1)

    }

}

