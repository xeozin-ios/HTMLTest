//
//  ViewController.swift
//  HTMLTest
//
//  Created by 홍서진 on 09/12/2018.
//  Copyright © 2018 홍서진. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mainURL = "http://www.ticketlink.co.kr/esports/main"
        guard let main = URL(string: mainURL) else {
            print("Error: \(mainURL) doesn't seem to be a valid URL")
            return
        }
        do {
            let lolMain = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: lolMain, encoding: .utf8)
            for product in doc.xpath("//div[@class='in']") {
//                print(product.content)
                if let productURL = product.at_xpath("a/strong"){
                    if let schedule = productURL.text {
                        print(schedule)
                    }
                }
            }
        } catch let error {
            print("Error: \(error)")
        }
    }
}

