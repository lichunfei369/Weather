//
//  viewQureDelegate.swift
//  Weather
//
//  Created by lichunfei on 2021/8/3.
//

import Foundation
import Alamofire
import SwiftyJSON
extension ViewController:QueryDelegate{
    //反向传值
    func didiChangeCity(city: String) {
        print(city)
        let parameters = ["location":city,"key":kqweatherWebKey]
        AF.request("https://geoapi.qweather.com/v2/city/lookup",parameters: parameters)
            .responseJSON { response in
                
                if let data =  response.value {
                    let cityJson = JSON(data)
                    self.weather.city = cityJson["location",0,"name"].stringValue
                    self.sysylocation.text = self.weather.city
                    
                    let parameters = ["location":cityJson["location",0,"id"],"key":kqweatherWebKey] as [String : Any]
                    AF.request("https://devapi.qweather.com/v7/weather/now",parameters: parameters)
                        .responseJSON { response in
                            
                            if let data =  response.value {
                              print(data)
                                let weatherJSON = JSON(data)
                                //stringValue 如果前面没有值是空的字符串 有的就取
                                self.weather.temp = "\(weatherJSON["now","temp"].stringValue) ~"
                         
                                self.tempLabel.text = self.weather.temp
                            }
                        }
                }
            }
    }
    
}
