//
//  FetchWeeklyData.swift
//  App parts
//
//  Created by Zachary Bader (student LM) on 4/20/23.
//

import Foundation

class FetchWeeklyData: ObservableObject{

    @Published var weeklyResponse: WeeklyResponse = WeeklyResponse()

    func getWeeklyData(postalCode: String) async{

        let URLString = "https://api.weatherapi.com/v1/forecast.json?key=30162b6f7d694ddaac1170346231201&q=\(postalCode)&days=7&aqi=no&alerts=no"

        guard let url = URL(string: URLString) else {return}

        do{

            let (data, _) = try await  URLSession.shared.data(from: url)

            weeklyResponse = try JSONDecoder().decode(WeeklyResponse.self, from: data)

        } catch{

            print(error)

        }
    }

}



struct WeeklyResponse: Codable{
    var location: Location = Location()
    var current: Current = Current()
    var forecast: Forecast = Forecast()

}



struct Forecast: Codable{
    var forecastday: [ForecastDay] = [ForecastDay()]

}



struct ForecastDay: Codable{
    var day: Day = Day()

}



extension ForecastDay: Identifiable{
    var id: String {return self.day.condition.icon}

}



struct Day: Codable{
    var maxtemp_f: Double = 40.0
    var mintemp_f: Double = 6.0
    var condition: Condition = Condition()

    

}
