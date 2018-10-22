//
//  Calculator.swift
//  fractals
//
//  Created by Alexander Zakatnov on 01/10/2018.
//  Copyright © 2018 Alexander Zakatnov. All rights reserved.
//

import UIKit

protocol BasePoint where Self:UIView {
    init(position:CGPoint)
}

protocol CalculatorDataSource: NSObjectProtocol {
    func numberOfVertices() -> Int
    func positionForVertexWith(number:Int) -> CGPoint
    func canvasSize() -> CGSize
    func startPosition() -> CGPoint
}

protocol CalculatorListener: NSObjectProtocol {
    func calculated(point:CGPoint)
    func stopped()
}

class Calculator {
    
    var delay:Float = 0.0
    
    weak var dataSource:CalculatorDataSource?
    weak var listener:CalculatorListener?
    
    private var isStopped = true
    
    func start() {
        guard isStopped else {
            return
        }
        isStopped = false
        guard let dataSource = self.dataSource, let listener = self.listener else {
            return
        }
        let numberOfVertices = dataSource.numberOfVertices()
        var currentPosition = dataSource.startPosition()
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else {
                return
            }
            while !strongSelf.isStopped {
                guard let strongSelf = self else {
                    return
                }
                let vertNumber = Int.random(in: 0..<numberOfVertices)
                let vertexPosition = dataSource.positionForVertexWith(number: vertNumber)
                let nextPoint = strongSelf.middlePosition(a: currentPosition, b: vertexPosition)
                currentPosition = nextPoint
                DispatchQueue.main.sync {
                    listener.calculated(point: nextPoint)
                }
            }
            if strongSelf.isStopped {
                strongSelf.listener?.stopped()
            }
        }
    }
    
    private func middlePosition(a:CGPoint, b:CGPoint) -> CGPoint {
        return CGPoint(x: (a.x + b.x) / 2.0, y: (a.y + b.y) / 2.0)
    }
    
    func stop() {
        isStopped = true
    }
    
}
