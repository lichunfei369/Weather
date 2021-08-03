//
//  QViewController.swift
//  Weather
//
//  Created by Apple on 2021/8/3.
//

import UIKit

protocol QueryDelegate {
    func didiChangeCity(city:String)
}

class QViewController: UIViewController  {
    var currentCity = ""
    var delelgate:QueryDelegate?//代理一般都是可选类型
    @IBOutlet weak var currentCityLB: UILabel!
    @IBOutlet weak var currenTX: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCityLB.text = currentCity
    }
    
    @IBAction func diss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func query(_ sender: Any) {
        delelgate?.didiChangeCity(city:currenTX.text!)
        dismiss(animated: true, completion: nil)
    }
    

}
