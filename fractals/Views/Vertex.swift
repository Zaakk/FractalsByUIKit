//
//  Vertex.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit

class Vertex: UIView {
    private var internalPosition = CGPoint.zero
    
    var position:CGPoint {
        get {
            return internalPosition
        }
    }

    override private init(frame: CGRect) {
        fatalError("init(frame:) disabled, use init(position:) instead")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(position:CGPoint) {
        super.init(frame: CGRect(x: position.x, y: position.y, width: 2.0, height: 2.0))
        internalPosition = position
    }
    
    override func layoutSubviews() {
        backgroundColor = UIColor.red
    }

}
