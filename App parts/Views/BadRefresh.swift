//
//  BadRefresh.swift
//  App parts
//
//  Created by Asher Polsky (student LM) on 4/21/23.
//

import SwiftUI

struct BadRefresh: View {
    
    @Binding var viewState: Int
    @Binding var badRefresh: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("Loading")
            }
            
                

            
        }.background(Rectangle()
            .fill(Color.cyanColor)
            .frame(width: 700,height: 1000)
                     
        )
        .task {
            if badRefresh == true {
                badRefresh = false
                viewState = 1
            }
        }
    }
}

struct BadRefresh_Previews: PreviewProvider {
    static var previews: some View {
        BadRefresh(viewState: Binding.constant(10), badRefresh: Binding.constant(false))
    }
}
