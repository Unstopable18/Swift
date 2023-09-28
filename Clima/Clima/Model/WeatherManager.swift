//
//  WeatherManager.swift
//  Clima
//
//  Created by CEMTREX on 27/09/23.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let baseURL="https://api.openweathermap.org/data/2.5/weather?"
    let appID="&appid=38a9088d74fc06827a545f6a79961837&units=metric"
//    let baseURL="https://api.openweathermap.org/data/2.5/weather?appid=38a9088d74fc06827a545f6a79961837&units=metric"
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityname:String){
        let urlString="\(baseURL)&q=\(cityname)\(appID)"
//        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude:CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString="\(baseURL)lat=\(latitude)&lon=\(longitude)\(appID)"
//        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString:String){
        if let url=URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData=data{
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data)-> WeatherModel? {
        let decoder=JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherResponse.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
//            print(weather)
            return weather
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
}
