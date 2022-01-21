//
//  VideoAdViewController.swift
//  CreamTower
//
//  Created by Luca Hummel on 21/01/22.
//

import GoogleMobileAds
import UIKit

class VideoAdViewController: UIViewController, GADFullScreenContentDelegate {
    
    /// The rewarded video ad.
    var rewardedAd: GADRewardedAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ GADSimulatorID ]
        
        navigationController?.isNavigationBarHidden = false
        
        
        callAd()
    }
    
    func callAd() {
        GADRewardedAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/1712485313", request: GADRequest()
        ) { (ad, error) in
            if let error = error {
                print("Rewarded ad failed to load with error: \(error.localizedDescription)")
                return
            }
            print(error)
            print(ad)
            print("Loading Succeeded")
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
//            self.rewardedAd?.present(fromRootViewController: self) {
//                let reward = self.rewardedAd?.adReward
//                print("Reward received with currency \(reward?.amount), amount \(reward?.amount.doubleValue)")
//                // TODO: Reward the user.
//            }
        }
    }
    
    // MARK: GADFullScreenContentDelegate
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Rewarded ad presented.")
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Rewarded ad dismissed.")
    }
    
    func ad(
        _ ad: GADFullScreenPresentingAd,
        didFailToPresentFullScreenContentWithError error: Error
    ) {
        print("Rewarded ad failed to present with error: \(error.localizedDescription).")
        let alert = UIAlertController(
            title: "Rewarded ad failed to present",
            message: "The reward ad could not be presented.",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(
            title: "Drat",
            style: .cancel,
            handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
