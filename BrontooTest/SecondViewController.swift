//
//  SecondViewController.swift
//  BrontooTest
//
//  Created by Webwerks on 01/07/19.
//  Copyright © 2019 Webwerks. All rights reserved.
//

import UIKit

struct JSONObject: Codable {
    var ip: String?
}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
    }
    func callAPI() {
        print("call API")
        
        let url = "https://api.ipify.org/?format=json"
        let req = URLRequest(url: URL(string: url)!)
        
        URLSession.shared.dataTask(with: req) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let ip = json["ip"] as! String
                print("ip: ", ip)
            } catch {
                print("error")
            }
            
            }.resume()
    }
}
