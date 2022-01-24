//
//  ShopViewController.swift
//  CreamTower
//
//  Created by Luca Hummel on 13/01/22.
//

import UIKit
import GoogleMobileAds

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GADFullScreenContentDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var shopCollection: UICollectionView!
    @IBOutlet weak var shopSegmented: UISegmentedControl!
    
    var rewardedAd: GADRewardedAd?
    
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
        
        unitsLabel.text = "\(getNumberBought(type: type, itemArray: &itemArray)) of \(itemArray.count)"
        unitsLabel.font = UIFont(name: "Shrikhand-Regular", size: 20)
        unitsLabel.textColor = UIColor(named: "grayApp")
        
        shopCollection.backgroundColor = .white
    }
    
    
    @IBAction func exitToMenu(_ sender: Any) {
        print(defaults.integer(forKey: "Money"))
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func suitDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            type = .flavor
        case 1:
            type = .cone
        case 2:
            type = .background
        default:
            type = .flavor
        }
        
        
        unitsLabel.text = "\(getNumberBought(type: type, itemArray: &itemArray)) of \(itemArray.count)"
        
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
            if money >= itemArray[indexPath.row].price {
                itemArray[indexPath.row].isBought.toggle()
                ItemRepository.shared.saveContext()
                money -= Int(itemArray[indexPath.row].price)
                defaults.set(money, forKey: "Money")
                defaults.synchronize()
                moneyLabel.text = "\(money)"
                unitsLabel.text = "\(getNumberBought(type: type, itemArray: &itemArray)) of \(itemArray.count)"
            } else {
                let ac = UIAlertController(title: "You do not have enough CreamGold", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(ac, animated: true)
            }
            
        }
        collectionView.reloadData()
    }
    
    
    func getNumberBought(type: objectType, itemArray: inout [Item]) -> Int {
        itemArray = []
        var bought = 0
        for i in ItemRepository.shared.getAllItems() {
            if i.type == type.rawValue {
                itemArray.append(i)
                if i.isBought == true {
                    bought += 1
                }
            }
        }
        return bought
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: Calling Ad
    
    func callAd() {
        GADRewardedAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/1712485313", request: GADRequest()
        ) { (ad, error) in
            if let error = error {
                print("Rewarded ad failed to load with error: \(error.localizedDescription)")
                return
            }
            print("Loading Succeeded")
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
        }
    }
    
    @IBAction func showAd(_ sender: Any) {
        if let ad = rewardedAd {
            ad.present(fromRootViewController: self) {
                let reward = ad.adReward
                self.earnCoins(value: 50)
                // TODO: Reward the user.
            }
        } else {
            let alert = UIAlertController(
                title: "Wait a minute!",
                message: "We do not have ads to show right now!",
                preferredStyle: .alert)
            let alertAction = UIAlertAction(
                title: "OK",
                style: .cancel,
                handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func earnCoins(value: NSInteger) {
        money += value
        defaults.set(money, forKey: "Money")
        print(defaults.integer(forKey: "Money"))
        moneyLabel.text = "\(money)"
    }
    
    // MARK: GADFullScreenContentDelegate
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Rewarded ad presented.")
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Rewarded ad dismissed.")
        self.callAd()
    }
    
    func ad(
        _ ad: GADFullScreenPresentingAd,
        didFailToPresentFullScreenContentWithError error: Error
    ) {
        print("Rewarded ad failed to present with error: \(error.localizedDescription).")
        let alert = UIAlertController(
            title: "Wait a minute!",
            message: "We do not have ads to show right now!",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
