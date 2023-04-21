//
//  DailyView.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/22/23.
//

import SwiftUI
//import struct Kingfisher.KFImage


struct DailyView: View {
    
    @StateObject var fetchWeeklyData: FetchWeeklyData = FetchWeeklyData()
    @StateObject var fetchData = FetchData()
    @Binding var viewState: Int
    @Binding var postalCode: String
    @Binding var updatePostalCode: String
    
    
    
    //Bad Refresh
    @Binding var badRefresh: Bool
    
    var body: some View {
        ZStack {
            if (fetchData.response.current.condition.text == "Sunny" || fetchData.response.current.condition.text == "Clear") {
                Image("Sunny")
                    .ignoresSafeArea()
                    .frame(width: 700,height: 700)
                    .opacity(0.60)
            }
            else if (fetchData.response.current.condition.text == "rainy" || fetchData.response.current.condition.text == "Rainy") {
                Image("Rainy")
                    .ignoresSafeArea()
                    .frame(width: 700,height: 700)
                    .opacity(0.60)
            }
            else if (fetchData.response.current.condition.text == "Partly cloudy" || fetchData.response.current.condition.text == "Cloudy") {
                Image("Cloudy")
                    .ignoresSafeArea()
                    .frame(width: 700,height: 700)
                    .opacity(0.60)
            }
            else if (fetchData.response.current.condition.text == "Overcast" || fetchData.response.current.condition.text == "Stormy") {
                Image("Cloudy")
                    .ignoresSafeArea()
                    .frame(width: 700,height: 700)
                    .opacity(0.60)
            }
            VStack {
                TextField("Enter Postal Code", text: $updatePostalCode)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray.opacity(0.8))
                    .frame(width: 200, height: 40, alignment: .center)
                    .cornerRadius(15.0)
                    .task {
                        await fetchData.getData(postalCode: postalCode)
                    }
                Button  {
                    postalCode = updatePostalCode
                    updatePostalCode = ""
                    viewState = 10
                    badRefresh = true
                } label: {
                    Text("Update")
                        .padding()
                        .frame(width: 120, height: 45)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(15.0)
                        .foregroundColor(Color.black)
                }
                
                
                Text(fetchData.response.location.name)
                    .foregroundColor(Color.orangeColor)
                    .font(.custom("Arial", size: 50))
                Text(String(format: "\(Int(fetchData.response.current.temp_f))°", "%.1f"))
                    .font(.custom("Arial", size: 90))
                    .foregroundColor(Color.orangeColor)
                    .padding(.leading, 23)
                Text(fetchData.response.current.condition.text)
                    .font(.custom("Arial", size: 40))
                    .foregroundColor(Color.orangeColor)
                    .padding(.bottom, 50)
                
                
//                HStack {
//                    Text("Humidity: \(fetchData.response.current.humidity)")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.gray.opacity(0.6))
//                        .cornerRadius(15.0)
//                    Text(String(format: "UV: \(fetchData.response.current.uv)", "%.1f"))
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.gray.opacity(0.6))
//                        .cornerRadius(15.0)
//                    Text("Wind Direction: \(fetchData.response.current.wind_dir)")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.gray.opacity(0.6))
//                        .cornerRadius(15.0)
//                }
//                print(response.forecast.forecastday[0].day.condition.icon)
                HStack {
//                    Text("Low: \(day.max)")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.gray.opacity(0.6))
//                        .cornerRadius(15.0)
//                    Text("High: \(fetchData.response.forecast.forecastday[1].day.maxtemp_f)")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.gray.opacity(0.6))
//                        .cornerRadius(15.0)
                }
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(fetchWeeklyData.weeklyResponse.forecast.forecastday){

                            forecastday in

                            ForecastDayView(day:forecastday.day)

                        }
                    }
                }.task{
                    await fetchWeeklyData.getWeeklyData(postalCode: postalCode)

                }
                
//                ScrollView(.horizontal) {
//
//                            ForEach(fetchWeeklyData.weeklyResponse.forecast.forecastday){
//
//                                forecastday in
//
//                                ForecastDayView(day:forecastday.day)
//
//                            }
//
//                        }
//                .frame(alignment: .trailing)
//                .task{
//                            await fetchWeeklyData.getWeeklyData(postalCode: postalCode)
//
//                        }
                
                Spacer()
                Spacer()
            }
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(viewState: Binding.constant(1), postalCode: Binding.constant("19003"), updatePostalCode: Binding.constant("19003"), badRefresh: Binding.constant(false))
    }
}
