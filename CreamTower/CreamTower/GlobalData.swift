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
    ItemEntity(name: "Tutti-Frutti", price: 500, imageName: "tuttiFruttiBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Pistachio", price: 500, imageName: "pistachioBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Coconut", price: 500, imageName: "coconutBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Dark Choco", price: 500, imageName: "darkChocolateBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Neapolitan", price: 750, imageName: "neapolitanBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Acai", price: 1000, imageName: "acaiBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Life", price: 5000, imageName: "lifeBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Devila", price: 10401, imageName: "neymarBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Rainbow", price: 2000, imageName: "rainbowBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Brazil", price: 1000, imageName: "brazilBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Dalmatian", price: 2000, imageName: "dalmatianBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Beach Ball", price: 3000, imageName: "beachBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Earth", price: 5000, imageName: "earthBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Candy", price: 2500, imageName: "candyBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Bronze", price: 5000, imageName: "bronzeBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Silver", price: 10000, imageName: "silverBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    ItemEntity(name: "Gold", price: 20000, imageName: "goldBall", isBought: false, isSelected: false, type: objectType.flavor.rawValue),
    
    
    ItemEntity(name: "Yellow", price: 0, imageName: "yellowCone", isBought: true, isSelected: true, type: objectType.cone.rawValue),
    ItemEntity(name: "Red", price: 500, imageName: "redCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Green", price: 1000, imageName: "greenCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Pink", price: 2000, imageName: "pinkCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Purple", price: 2000, imageName: "purpleCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Black", price: 4000, imageName: "blackCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "White", price: 4000, imageName: "whiteCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Bronze", price: 5000, imageName: "bronzeCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Silver", price: 10000, imageName: "silverCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    ItemEntity(name: "Gold", price: 20000, imageName: "goldCone", isBought: false, isSelected: false, type: objectType.cone.rawValue),
    
    
    ItemEntity(name: "Blue", price: 0, imageName: "backBlue", isBought: true, isSelected: true, type: objectType.background.rawValue),
    ItemEntity(name: "Brown", price: 500, imageName: "backBrown", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Red", price: 500, imageName: "backRed", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Pink", price: 1000, imageName: "backPink", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Purple", price: 1500, imageName: "backPurple", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Yellow", price: 1500, imageName: "backYellow", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Candy", price: 3000, imageName: "candyBack", isBought: false, isSelected: false, type: objectType.background.rawValue),
    ItemEntity(name: "Blue-Green", price: 3000, imageName: "greenBlueBack", isBought: false, isSelected: false, type: objectType.background.rawValue),
    
    
    
]
