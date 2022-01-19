//
//  MenuViewController.swift
//  CreamTower
//
//  Created by Luca Hummel on 13/01/22.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        
        ManagerGameCenter.authenticateUser(from: self, label: UILabel())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ManagerGameCenter.showAvatarGameCenter(isVisible: true)
    }
    
    
    override var prefersStatusBarHidden: Bool { return true }
    
    
    @IBAction func playGame(_ sender: Any) {
        ManagerGameCenter.showAvatarGameCenter(isVisible: false)

    }
    
    @IBAction func goToShop(_ sender: Any) {
        ManagerGameCenter.showAvatarGameCenter(isVisible: false)
    }
    
    @IBAction func goToRank(_ sender: Any) {
        if (!ManagerGameCenter().toSpecificPage(from: self, to: .leaderboards)) {
            print("Not connected")
        }
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
