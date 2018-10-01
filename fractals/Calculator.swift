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
    func generated(point:BasePoint)
}

class Calculator {
    
    weak var dataSource:CalculatorDataSource?
    weak var listener:CalculatorListener?
    
    private var isStopped = true
    
    func start() {
        isStopped = false
        guard let dataSource = self.dataSource else {
            return
        }
        let numberOfVertices = dataSource.numberOfVertices()
        let canvasSize = dataSource.canvasSize()
        DispatchQueue.global().async { [weak self] in
            while !(self?.isStopped ?? false) {
                let vertNumber = Int.random(in: 0..<numberOfVertices)
                let vertexPosition = dataSource.positionForVertexWith(number: vertNumber)
            }
        }
    }
    
    func stop() {
        isStopped = true
    }
    
}
