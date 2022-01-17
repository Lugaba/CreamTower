//
//  ShopViewController.swift
//  CreamTower
//
//  Created by Luca Hummel on 13/01/22.
//

import UIKit

class ShopViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unitsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        titleLabel.text = "Shop"
        titleLabel.font = UIFont(name: "Shrikhand-Regular", size: 45)
        titleLabel.textColor = UIColor(named: "pinkApp")

        unitsLabel.text = "3 of 49"
        unitsLabel.font = UIFont(name: "Shrikhand-Regular", size: 20)
        unitsLabel.textColor = UIColor(named: "grayApp")

        
    }
    
    
    @IBAction func exitToMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
