//
//  String+Localize.swift
//  CreamTower
//
//  Created by Luca Hummel on 07/02/22.
//

// Única classe usada (pode substituir essa linha por: import Foundation)
import func Foundation.NSLocalizedString
import UIKit


extension String {
        // Nova função:
    func localized() -> String {       // Vai retornar uma string
        return NSLocalizedString(
            self,                      // Pega a própria strig em que a função foi chamada
            tableName: "Localization", // Nome do arquivo .string (vai ser criado)
            bundle: .main,
            value: self,               // Caso não tenha um valor á aquela string vai ser usada ela mesmo
            comment: self
        )
    }
}

protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized()
        }
    }
}

extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized(), for: .normal)
        }
   }
}

