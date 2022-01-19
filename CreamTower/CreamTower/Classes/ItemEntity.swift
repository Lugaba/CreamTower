//
//  ItemEntity.swift
//  CreamTower
//
//  Created by Luca Hummel on 18/01/22.
//

import Foundation

public class ItemEntity {
    var name: String
    var price: Int32
    var imageName: String
    var isBought: Bool
    var isSelected: Bool
    var type: String
    
    init(name: String, price: Int32, imageName: String, isBought: Bool, isSelected: Bool, type: String) {
        self.name = name
        self.price = price
        self.imageName = imageName
        self.isBought = isBought
        self.isSelected = isSelected
        self.type = type
    }
}
