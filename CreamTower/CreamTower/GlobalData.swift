//
//  GlobalData.swift
//  CreamTower
//
//  Created by Luca Hummel on 18/01/22.
//

import Foundation

public enum objectType: String {
    case flavor = "flavor"
    case cone = "cone"
    case background = "background"
}


public var itemsData: [ItemEntity] = [
    ItemEntity(name: "Chocolate", price: 0, imageName: "chocolateBall", isBought: true, isSelected: true, type: objectType.flavor.rawValue),
    ItemEntity(name: "Strawberry", price: 0, imageName: "strawberryBall", isBought: true, isSelected: true, type: objectType.flavor.rawValue),
    ItemEntity(name: "Cream", price: 0, imageName: "creamBall", isBought: true, isSelected: true, type: objectType.flavor.rawValue),
    ItemEntity(name: "Tutti-Frutti", price: 250, imageName: "tuttiFruttiBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Pistachio", price: 350, imageName: "pistachioBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Coconut", price: 350, imageName: "coconutBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Dark Choco", price: 350, imageName: "darkChocolateBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Acai", price: 500, imageName: "acaiBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Life", price: 5000, imageName: "lifeBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Gold", price: 10000, imageName: "goldBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    
    
    ItemEntity(name: "Yellow", price: 0, imageName: "yellowCone", isBought: true, isSelected: true, type: objectType.cone.rawValue),
    ItemEntity(name: "Red", price: 200, imageName: "redCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Green", price: 500, imageName: "greenCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Pink", price: 1000, imageName: "pinkCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Purple", price: 1000, imageName: "purpleCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Black", price: 2000, imageName: "blackCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    
    
    ItemEntity(name: "Blue", price: 0, imageName: "backBlue", isBought: true, isSelected: true, type: objectType.background.rawValue),
    ItemEntity(name: "Brown", price: 300, imageName: "backBrown", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Pink", price: 500, imageName: "backPink", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Purple", price: 750, imageName: "backPurple", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Yellow", price: 750, imageName: "backYellow", isBought: false, isSelected: false, type: objectType.background.rawValue),
]
