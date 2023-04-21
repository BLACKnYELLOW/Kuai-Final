//
//  FetchData.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 3/22/23.
//

import Foundation

class FetchData: ObservableObject {
    
    @Published var response: Response = Response()
    
    func getData(postalCode: String) async {
        let URLString = "https://api.weatherapi.com/v1/forecast.json?key=30162b6f7d694ddaac1170346231201&q=\(postalCode)&days=7&aqi=no&alerts=no"
        
        guard let url = URL(string: URLString) else {return}
        
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            response = try JSONDecoder().decode(Response.self, from: data)
            
        } catch {
            print(error)
        }
    }//end of getData func
}//end of class

struct Response: Codable {
    var location: Location = Location()
    var current: Current = Current()
//    var forecast: Forecast = Forecast()
}


struct Location: Codable {
    var name: String = "Defualt"
    var region: String = "Defualt"
}


struct Current: Codable {
    var condition: Condition = Condition()
    var temp_f: Double = 0
    var wind_dir: String = ""
    var humidity: Int = 0
    var feelslike_f: Double = 0
    var uv: Double = 0
}

struct Condition: Codable {
    var text: String = "Sunny"
    var icon: String = "//cdn.weatherapi.com/weather/64x64/day/302.png"
}

//struct Forecast: Codable {
//    var forecastday: [ForecastDay] = []
//}
//
//struct ForecastDay: Codable {
//    var day: Day = Day()
//}
//
//extension ForecastDay: Identifiable {
//    var id: String {return self.day.condition.icon}
//}
//
//struct Day: Codable {
//    var maxtemp_f: Double = 50.0
//    var mintemp_f: Double = 30.0
//    var condition: Condition = Condition()
//}
