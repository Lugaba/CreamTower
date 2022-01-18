//
//  ShopViewController.swift
//  CreamTower
//
//  Created by Luca Hummel on 13/01/22.
//

import UIKit

enum objectType {
    case flavor
    case cone
    case background
}

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var shopCollection: UICollectionView!
    @IBOutlet weak var shopSegmented: UISegmentedControl!
    
    let reuseIdentifier = "shopCell"
    
    let defaults = UserDefaults.standard
    var money = 0
    
    var type: objectType = .flavor
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        money = defaults.integer(forKey: "Money")
        
        navigationController?.isNavigationBarHidden = true
        
        titleLabel.text = "Shop"
        titleLabel.font = UIFont(name: "Shrikhand-Regular", size: 45)
        titleLabel.textColor = UIColor(named: "pinkApp")
        
        moneyLabel.text = "\(money)"
        moneyLabel.font = UIFont(name: "Shrikhand-Regular", size: 20)
        moneyLabel.textColor = UIColor(named: "grayApp")
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        shopSegmented.setTitleTextAttributes(titleTextAttributes, for: .normal)
        
        var bought = 0
        for i in ItemRepository.shared.getAllItems() {
            if i.type == "flavor" {
                itemArray.append(i)
                if i.isBought == true {
                    bought += 1
                }
            }
        }
        unitsLabel.text = "\(bought) of \(itemArray.count)"
        unitsLabel.font = UIFont(name: "Shrikhand-Regular", size: 20)
        unitsLabel.textColor = UIColor(named: "grayApp")
        
        shopCollection.backgroundColor = .white
    }
    
    
    @IBAction func exitToMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func suitDidChange(_ sender: UISegmentedControl) {
        itemArray = []
        var typeStr = ""
        switch sender.selectedSegmentIndex {
            case 0:
                type = .flavor
                typeStr = "flavor"
            case 1:
                type = .cone
                typeStr = "cone"
            case 2:
                type = .background
                typeStr = "background"
            default:
                type = .flavor
        }
        
        var bought = 0
        for i in ItemRepository.shared.getAllItems() {
            if i.type == typeStr {
                itemArray.append(i)
                if i.isBought == true {
                    bought += 1
                }
            }
        }
        unitsLabel.text = "\(bought) of \(itemArray.count)"
        
        shopCollection.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return itemArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ShopCollectionViewCell
        
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
        
        cell.titleLabel.text = itemArray[indexPath.row].name
        cell.titleLabel.font = UIFont(name: "Shrikhand-Regular", size: 20)
        cell.titleLabel.textColor = UIColor(named: "pinkApp")
        
        cell.imageItem.image = UIImage(named: itemArray[indexPath.row].imageName ?? "chocolateBall")
        
        cell.StatusLabel.font = UIFont(name: "Shrikhand-Regular", size: 15)
        cell.StatusLabel.textColor = UIColor(named: "grayApp")
        if itemArray[indexPath.row].isBought == true {
            cell.lockView.isHidden = true
            cell.goldIcon.isHidden = true
            if itemArray[indexPath.row].isSelected == false{
                cell.StatusLabel.text = "Select"
            } else {
                cell.StatusLabel.text = "Selected"
                cell.StatusLabel.textColor = UIColor(named: "greenApp")
            }
        } else {
            cell.lockView.isHidden = false
            cell.goldIcon.isHidden = false
            cell.lockView.layer.cornerRadius = 15
            cell.lockView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
            
            cell.StatusLabel.text = "\(itemArray	[indexPath.row].price)"
            cell.StatusLabel.textColor = .white
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if itemArray[indexPath.row].isBought == true {
            itemArray[indexPath.row].isSelected.toggle()
            if type == .cone || type == .background {
                for index in 0..<itemArray.count {
                    if index != indexPath.row && itemArray[index].isSelected == true {
                        itemArray[index].isSelected.toggle()
                    }
                }
            }
            ItemRepository.shared.saveContext()
        } else {
            if money > itemArray[indexPath.row].price {
                itemArray[indexPath.row].isBought.toggle()
                ItemRepository.shared.saveContext()
                money -= Int(itemArray[indexPath.row].price)
                defaults.set(money, forKey: "Money")
            }
            
        }
        collectionView.reloadData()
    }
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
