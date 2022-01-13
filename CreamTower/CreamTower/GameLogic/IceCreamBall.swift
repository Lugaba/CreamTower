//
//  IceCreamBall.swift
//  CreamTower
//
//  Created by Luca Hummel on 13/01/22.
//

import SpriteKit

class IceCreamBall: Equatable {
    static func == (lhs: IceCreamBall, rhs: IceCreamBall) -> Bool {
        return lhs.iceCreamBallNode == rhs.iceCreamBallNode && lhs.image == rhs.image && lhs.velY == rhs.velY
    }
    
    var image: String
    var velY: CGFloat
    let iceCreamBallNode: SKSpriteNode
    
    init() {
        image = ""
        velY = 0
        iceCreamBallNode = SKSpriteNode(imageNamed: image)
    }
    
    init(image: String, velY: CGFloat) {
        self.image = image
        self.velY = velY
        iceCreamBallNode = SKSpriteNode(imageNamed: image)
    }
    
    init(image: String) {
        self.image = image
        self.velY = 0
        iceCreamBallNode = SKSpriteNode(imageNamed: image)
    }
    
}

