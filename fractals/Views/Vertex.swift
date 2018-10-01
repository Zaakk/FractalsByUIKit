//
//  Vertex.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit

class Vertex: UIView, BasePoint {

    override private init(frame: CGRect) {
        fatalError("init(frame:) disabled, use init(position:) instead")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(position:CGPoint) {
        super.init(frame: CGRect(x: position.x, y: position.y, width: 1.0, height: 1.0))
    }
    
    override func layoutSubviews() {
        backgroundColor = UIColor.red
    }

}
