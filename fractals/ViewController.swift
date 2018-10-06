//
//  ViewController.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let calculator = Calculator()
    
    @IBOutlet weak var verticesField: UITextField!
    @IBOutlet weak var canvas: Canvas!
    @IBOutlet weak var confimModeControl: UISegmentedControl!
    
    @IBAction func run(_ sender: Any) {
        calculator.listener = canvas
        calculator.dataSource = canvas
        calculator.start()
        confimModeControl.isEnabled = false
    }
    
    @IBAction func clear(_ sender: Any) {
        confimModeControl.isEnabled = true
        calculator.stop()
        canvas.clear()
    }
    
    @IBAction func configModeChanged(_ sender: UISegmentedControl) {
        guard let configMode = ConfigMode(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        canvas.configMode = configMode
    }
    
    @IBAction func stop(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

