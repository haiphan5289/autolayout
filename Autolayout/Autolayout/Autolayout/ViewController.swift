//
//  ViewController.swift
//  Autolayout
//
//  Created by HaiPhan on 11/15/18.
//  Copyright © 2018 HaiPhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapped(_ sender: UIButton) {
        if sender.title(for:.normal) == "X" {
            sender.setTitle("Đang chạm", for: .normal)
            
        }else {
            sender.setTitle("X", for: .normal)
        }
    }
    
}

