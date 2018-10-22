//
//  Vertex.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit
import SpriteKit

class Vertex: SKSpriteNode {
    
    required init(position:CGPoint) {
        super.init(texture: nil, color: UIColor.green, size: CGSize(width: 2.0, height: 2.0))
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
