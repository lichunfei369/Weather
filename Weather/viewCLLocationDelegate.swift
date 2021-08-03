//
//  viewCLLocationDelegate.swift
//  Weather
//
//  Created by lichunfei on 2021/8/3.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON
extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
        print(lon,lat)
        AF.request("https://devapi.qweather.com/v7/weather/now?location=\(lon),\(lat)&key=d9bfccf712f14351b4254436219a589f")
            .responseJSON { response in
                
                if let data =  response.value {
                  print(data)
                    let weatherJSON = JSON(data)
                    //stringValue 如果前面没有值是空的字符串 有的就取
                    self.weather.temp = "\(weatherJSON["now","temp"].stringValue) ~"
//                    self.weather.city =
             
                    self.tempLabel.text = self.weather.temp
                }
            }
        AF.request("https://geoapi.qweather.com/v2/city/lookup?location=\(lon),\(lat)&key=d9bfccf712f14351b4254436219a589f")
            .responseJSON { response in
                if let data = response.value{
                    let cityJson = JSON(data)
                    self.weather.city = cityJson["location",0,"name"].stringValue
                    self.sysylocation.text = self.weather.city
                    
                }
            }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        self.sysylocation.text = "获取位置失败!!!"
    }
}
