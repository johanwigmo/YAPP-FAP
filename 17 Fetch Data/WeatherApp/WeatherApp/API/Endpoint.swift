//
//  Endpoint.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

enum Endpoint {
    
    // Current
    case currentByCity(city: String)
    case currentById(id: String)
    case currentByCoord(lat: Double, lon: Double)
  
    // Forecast
    case forecastByCity(city: String)
    case forecastById(id: String)
    case forecastByCoord(lat: Double, lon: Double)
    
    
    var url: URL {
        guard var components = URLComponents(string: ApiManager.baseUrl) else {
            fatalError("ERROR - ApiManager.baseUrl is not a valid URL")
        }
        
        switch self {
        case .currentByCity(let city):
            components.path.append("weather")
            components.queryItems = [URLQueryItem(name: "q", value: city)]
            
        case .currentById(let id):
            components.path.append("weather")
            components.queryItems = [URLQueryItem(name: "id", value: id)]
            
        case .currentByCoord(let lat, let lon):
            components.path.append("weather")
            components.queryItems = [URLQueryItem(name: "lat", value: String(lat)),
                                     URLQueryItem(name: "lon", value: String(lon))]
            

        case .forecastByCity(let city):
            components.path.append("forecast")
            components.queryItems = [URLQueryItem(name: "q", value: city)]
            
        case .forecastById(let id):
            components.path.append("forecast")
            components.queryItems = [URLQueryItem(name: "id", value: id)]
            
        case .forecastByCoord(let lat, let lon):
            components.path.append("forecast")
            components.queryItems = [URLQueryItem(name: "lat", value: String(lat)),
                                     URLQueryItem(name: "lon", value: String(lon))]
            
        
        }
        
        components.queryItems?.append(URLQueryItem(name: "appid", value: Token.shared.openWeatherMapApi))
        
        guard let url = components.url else {
            fatalError("ERROR - ApiManager.baseUrl is not a valid URL")
        }
        
        return url
    }
    
}
