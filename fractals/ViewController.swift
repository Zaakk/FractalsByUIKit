//
//  ViewController.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var verticesField: UITextField!
    @IBOutlet weak var canvas: Canvas!
    
    @IBAction func run(_ sender: Any) {
        guard let numberOfVerts = Int(verticesField.text ?? "") else {
            return
        }
        canvas.maxNumberOfVertices = numberOfVerts
    }
    
    @IBAction func clear(_ sender: Any) {
        canvas.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

