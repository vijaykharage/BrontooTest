//
//  ViewController.swift
//  BrontooTest
//
//  Created by Webwerks on 01/07/19.
//  Copyright © 2019 Webwerks. All rights reserved.
//

import UIKit
import WebKit



class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self
        webView.uiDelegate = self
        loadURL()
            }

    /*override func loadView() {
        let contentController = WKUserContentController()
        let scriptSource = "document.body.style.backgroundColor = `red`;"
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
     
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
     
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), configuration: config)
     
    }*/
    private func loadURL() {
        let url = "https://test.ostaapp.com/webview/"
        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
    }
    
    

extension ViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished®")
        
        webView.evaluateJavaScript("document.getElementById('responseBtn').innerText") { (resp, err) in
            print(resp as! String)
            
        }
        
        
        
    }
    
    /*func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        extractJsonObjFromScriptMsg(message: message)
    }*/
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let ac = UIAlertController(title: "Hey, listen!", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true)
        completionHandler()
    }
    
    /*func extractJsonObjFromScriptMsg(message: WKScriptMessage) {
        //get the object first
        //step 1: check if the obj is a string
        if let objStr = message.body as? String {
            //step 2: convert the string to Data
            let data: Data = objStr.data(using: .utf8)!
            do {
                let jsObj = try JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0))
                if let jsonObjDict = jsObj as? Dictionary<String, Any> {
                    print(jsonObjDict)
                } else if let jsonArr = jsObj as? [Dictionary<String, Any>] {
                    for jsonObj in jsonArr {
                        print(jsonObj)
                    }
                }
            } catch _ {
                print("having trouble converting it to a dictionary")
            }
        }
     
    }*/
    

}
