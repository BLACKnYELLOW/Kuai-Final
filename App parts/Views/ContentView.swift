//
//  ContentView.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/21/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var viewState: Int = 3
    @State var postalCode: String = ""
    @State var updatePostalCode: String = ""
    
    
    
    //refresh
    @State var badRefresh: Bool = false
    
    
    
    var body: some View {
        ZStack {
            VStack {
                if viewState == 1 {
                    DailyView(viewState: $viewState, postalCode: $postalCode, updatePostalCode: $updatePostalCode, badRefresh: $badRefresh)
                } else if viewState == 2 {
                    CalendarView(viewState: $viewState)
                } else if viewState == 3 {
                    HomeView(viewState: $viewState, badRefresh: $badRefresh)
                } else if viewState == 4 {
                    AlarmView()
                } else if viewState == 5 {
                    SettingsView(viewState: $viewState)
                } else if viewState == 10 {
                    BadRefresh(viewState: $viewState, badRefresh: $badRefresh)
                }
            }//VStack
            VStack {
                Spacer()
                CustomTabBar(viewState: $viewState)
                    .frame(height: 30)
            }//VStack
        }//ZStack
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
