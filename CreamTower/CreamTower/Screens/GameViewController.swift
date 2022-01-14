//
//  GameViewController.swift
//  CreamTower
//
//  Created by Luca Hummel on 12/01/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    let scene = SKScene(fileNamed: "GameScene")
    @IBOutlet weak var pauseButton: UIButton!
    
    var paused = false
    private lazy var pauseView = PauseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.isNavigationBarHidden = true
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = scene {
                // Set the scale mode to scale to fit the window
                //scene.scaleMode = .aspectFit
                // Present the scene
                view.presentScene(scene)
            }
            
                view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func pauseGame(_ sender: Any) {
        if paused {
            scene?.isPaused = false
            paused = false
        } else {
            scene?.isPaused = true
            paused = true
            
            self.view.addSubview(self.pauseView)

        }
    }

}
