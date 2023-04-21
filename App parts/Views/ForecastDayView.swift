//
//  ForecastDayView.swift
//  App parts
//
//  Created by Zachary Bader (student LM) on 4/20/23.
//

import SwiftUI

struct ForecastDayView: View {
    
    var day: Day
    var body: some View {
        
        HStack(alignment: .center) {
            
            
            Text(day.condition.text)
                .padding()
                .font(.custom("Arial", size: 25))
                .foregroundColor(Color.lightOrange)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15.0)
          
            VStack(alignment: .trailing){
               
                Text("Low: \(String(format: "\(Int(day.mintemp_f))°", "%.1f"))")
                    .padding()
                    .font(.custom("Arial", size: 20))
                    .foregroundColor(Color.lightOrange)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15.0)
                    .frame(width: 150,height: 50)
                    
                
                Text("High: \(String(format: "\(Int(day.maxtemp_f))°", "%.1f"))")
                    .padding()
                    .font(.custom("Arial", size: 20))
                    .foregroundColor(Color.lightOrange)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15.0)
                    .frame(width: 150,height: 50)
                
            }
            
        }
        
    }
    
}



struct ForecastDayView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForecastDayView(day: Day())
        
    }
    
}
