//
//  ViewController.swift
//  Weather
//
//  Created by Apple on 2021/8/3.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
class ViewController: UIViewController{
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var sysylocation: UILabel!
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    override func viewDidLoad() {
        super.viewDidLoad()
        //请求位置的权限
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
        
    
    }
    

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // 判断是那个跳转
        if let vc = segue.destination as? QViewController{
            //不能使用这样的方法 因为还没有加载空间就赋值导致为nil
//            vc.currentCityLB.text = weather.city
            //给要传的值赋值
            vc.currentCity = weather.city
            vc.delelgate = self
        }
    }
    
   
}

