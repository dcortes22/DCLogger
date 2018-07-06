//
//  ViewController.swift
//  DCLogger
//
//  Created by dcortes22 on 07/05/2018.
//  Copyright (c) 2018 dcortes22. All rights reserved.
//

import UIKit
import DCLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DCLogger.tag = "Sample"
        DCLogger.info("View Did Load")
        DCLogger.error("Testing error")
        DCLogger.warning("Testing Warning")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DCLogger.debug("View Will Appear")
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

}

