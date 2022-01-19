//
//  ManagerGameCenter.swift
//  CreamTower
//
//  Created by Luca Hummel on 18/01/22.
//

import GameKit


class ManagerGameCenter: GKGameCenterViewController, GKGameCenterControllerDelegate {
    
    static func authenticateUser(from:UIViewController, label:UILabel) -> Void {
        GKLocalPlayer.local.authenticateHandler = { vc, error in
            if (vc == nil && error == nil) {
                self.showAvatarGameCenter(isVisible: true)
                self.getHighScoreFromLeadboard(label:label)
                return
            }
            guard error == nil else { return }
            
            from.present(vc!, animated: true, completion: nil)
        }
    }
    
    static func showAvatarGameCenter(isVisible:Bool) -> Void {
        if (GKLocalPlayer.local.isAuthenticated) {
            GKAccessPoint.shared.location = .topLeading
            GKAccessPoint.shared.showHighlights = false
            GKAccessPoint.shared.isActive = isVisible
        }
    }
    
    static func setHighScore(score:Int) -> Void {
        if (GKLocalPlayer.local.isAuthenticated) {
            GKLeaderboard.submitScore(score, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["testesorvete1"], completionHandler: {error in} )
        }
    }
    
    static func getHighScoreFromLeadboard(label:UILabel) -> Void {
        if (GKLocalPlayer.local.isAuthenticated) {
            GKLeaderboard.loadLeaderboards(IDs: ["testesorvete1"]) { leaderboards, _ in
                leaderboards?[0].loadEntries(for: [GKLocalPlayer.local], timeScope: .allTime) {
                    player, _, _ in
                    UserDefaults.standard.set(player?.score, forKey: "HighScore")
                    print(String(UserDefaults.standard.integer(forKey: "HighScore")))
                }
            }
        }
    }
            
    public func toSpecificPage(from:UIViewController, to:GKGameCenterViewControllerState) -> Bool {
        if (GKLocalPlayer.local.isAuthenticated) {
            let viewController = GKGameCenterViewController(
                            leaderboardID: "testesorvete1",
                            playerScope: .global,
                            timeScope: .allTime) 
            viewController.gameCenterDelegate = self
            from.present(viewController, animated: true, completion: nil)
            return true
        }; return false
    }

    
    /* MARK: - Delegate */

    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) -> Void {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
}
