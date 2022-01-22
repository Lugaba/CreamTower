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
    var currentGame: GameScene?
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var pauseButton: UIButton!
    
    var paused = false
    private lazy var pauseView = PauseView()
    private lazy var endGameView = EndGameView()
    
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endGameView.removeFromSuperview()

        
        navigationController?.isNavigationBarHidden = true
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                //scene.scaleMode = .aspectFit
                // Present the scene
                view.presentScene(scene)
                
                currentGame = scene as? GameScene
                currentGame?.gameViewController = self
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func pauseGame(score: Int) {
        self.score = score
        if currentGame?.realPause == false {
            pauseView.removeFromSuperview()
            currentGame?.action(forKey: "aKey")?.speed = 1
        } else {

            self.view.addSubview(self.pauseView)
            pauseView.backButton.addTarget(self, action: #selector(pauseGameToggle), for: .touchUpInside)
            pauseView.quitButton.addTarget(self, action: #selector(exitToMenu), for: .touchUpInside)
            pauseView.setPointsText(score: score)
            pauseView.setHighPointsText(highScore: defaults.integer(forKey: "HighScore"))
        }
        print(currentGame?.action(forKey: "aKey")?.speed)
    }
    
    @objc func pauseGameToggle() {
        currentGame?.realPause.toggle()
        pauseGame(score: score)
    }
    
    @objc func exitToMenu() {
        navigationController?.popViewController(animated: true)
    }
    
    func showEngGameView(score: Int) {
        self.view.addSubview(self.endGameView)
        endGameView.playButton.addTarget(self, action: #selector(viewDidLoad), for: .touchUpInside)
        endGameView.quitButton.addTarget(self, action: #selector(exitToMenu), for: .touchUpInside)
        endGameView.setPointsText(score: score)
        endGameView.setHighPointsText(highScore: defaults.integer(forKey: "HighScore"))
    }
    
}
