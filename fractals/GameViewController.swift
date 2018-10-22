//
//  GameViewController.swift
//  fractals
//
//  Created by Alexander Zakatnov on 22/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    let calculator = Calculator()
    
    @IBOutlet weak var verticesField: UITextField!
    @IBOutlet weak var confimModeControl: UISegmentedControl!
    
    var canvas: Canvas?
    
    @IBAction func run(_ sender: Any) {
        calculator.listener = canvas
        calculator.dataSource = canvas
        calculator.start()
        confimModeControl.isEnabled = false
    }
    
    @IBAction func clear(_ sender: Any) {
        confimModeControl.isEnabled = true
        calculator.stop()
    }
    
    @IBAction func configModeChanged(_ sender: UISegmentedControl) {
        guard let configMode = ConfigMode(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        canvas?.configMode = configMode
    }
    
    @IBAction func stop(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let scene = SKScene(fileNamed: "GameScene") as? Canvas, let view = self.view as? SKView else {
            return
        }
        
        canvas = scene
        
        scene.scaleMode = .aspectFill
        
        view.presentScene(scene)
        view.ignoresSiblingOrder = true
        
        view.showsFPS = true
        view.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
