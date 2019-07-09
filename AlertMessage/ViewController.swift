//
//  ViewController.swift
//  AlertMessage
//
//  Created by Gustavo Rega Souza on 08/07/2019.
//  Copyright © 2019 Gustavo Rega Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func fromTop(_ sender: UIButton) {
        let myAlert = AlertMessage()
        myAlert.alertFrom = .top
        myAlert.showAlert(withMessage: "This is my message alert from TOP!", inRootView: self.view)
    }
    
    @IBAction func fromBottom(_ sender: UIButton) {
        let myAlert = AlertMessage()
        myAlert.alertFrom = .bottom
        myAlert.showAlert(withMessage: "This is my message alert from BOTTOM!", inRootView: self.view)
    }
    
}

