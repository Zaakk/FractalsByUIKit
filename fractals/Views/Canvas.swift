//
//  Canvas.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit

@IBDesignable
class Canvas: UIView {
    
    private var points:Set<Point> = []
    private var vertices:[Vertex] = []
    
    @IBInspectable var maxNumberOfVertices:Int = 0
    
    func add(point:Point) {
        let (inserted, _) = points.insert(point)
        if inserted {
            addSubview(point)
        }
    }
    
    func add(vertex:Vertex) {
        guard vertices.count < maxNumberOfVertices else {
            return
        }
        vertices.append(vertex)
        addSubview(vertex)
    }
    
    func clear() {
        vertices.forEach { (vertex) in
            vertex.removeFromSuperview()
        }
        vertices.removeAll()
        
        points.forEach { (point) in
            point.removeFromSuperview()
        }
        points.removeAll()
    }
    
    func position(for vertNumber:Int) -> CGPoint {
        return vertices[vertNumber].frame.origin
    }

}
