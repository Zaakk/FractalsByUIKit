//
//  Canvas.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit

enum ConfigMode:Int {
    case vertices = 0
    case startPoint = 1
}

@IBDesignable
class Canvas: UIView {
    private var points:Set<Point> = []
    private var vertices:[Vertex] = []
    private var startPoint:Point = Point(position: CGPoint.zero)
    
    var configModeEnabled:Bool = true {
        didSet {
            isUserInteractionEnabled = configModeEnabled
        }
    }
    
    var configMode:ConfigMode = .vertices
    
    func add(point:Point) {
        let (inserted, _) = points.insert(point)
        if inserted {
            addSubview(point)
        }
    }
    
    func add(vertex:Vertex) {
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
    
    //MARK: Touches handlers
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        switch configMode {
        case .vertices:
            add(vertex: Vertex(position: location))
        case .startPoint:
            let point = Point(position: location)
            point.backgroundColor = UIColor.yellow
            startPoint.removeFromSuperview()
            startPoint = point
            add(point: point)
        }
        
    }
}

extension Canvas:CalculatorListener {
    func calculated(point: CGPoint) {
        let dot = Point(position:point)
        add(point: dot)
    }
}

extension Canvas:CalculatorDataSource {
    func numberOfVertices() -> Int {
        return vertices.count
    }
    
    func positionForVertexWith(number: Int) -> CGPoint {
        return vertices[number].position
    }
    
    func canvasSize() -> CGSize {
        return self.frame.size
    }
    
    func startPosition() -> CGPoint {
        return startPoint.position
    }
}
