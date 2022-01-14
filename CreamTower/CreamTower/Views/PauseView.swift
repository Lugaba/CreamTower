//
//  PauseView.swift
//  CreamTower
//
//  Created by Luca Hummel on 14/01/22.
//

import UIKit


class PauseView: UIView {
    
    let backButton:UIButton = UIButton()
    var titleLabel: UILabel = UILabel()
    var scoreLabel: UILabel = UILabel()
    var highScoreLabel: UILabel = UILabel()
    
    var pointsLabel: UILabel = UILabel()
    var highPointsLabel: UILabel = UILabel()
    
    var quitButton: UIButton = UIButton()
    
    private let container: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 15
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.clipsToBounds = true
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        
        self.addSubview(container)
        
        

        
        titleLabel.text = "Game Paused"
        titleLabel.font = UIFont(name: "Shrikhand-Regular", size: 30)
        titleLabel.textColor = UIColor(named: "pinkApp")
        self.container.addSubview(self.titleLabel)
        
        
        scoreLabel.text = "Score"
        scoreLabel.font = UIFont(name: "Shrikhand-Regular", size: 25)
        scoreLabel.textColor = UIColor(named: "grayApp")
        self.container.addSubview(self.scoreLabel)
        
        highScoreLabel.text = "High"
        highScoreLabel.font = UIFont(name: "Shrikhand-Regular", size: 25)
        highScoreLabel.textColor = UIColor(named: "grayApp")
        self.container.addSubview(self.highScoreLabel)
        
        pointsLabel.text = "100"
        pointsLabel.font = UIFont(name: "Shrikhand-Regular", size: 20)
        pointsLabel.textColor = UIColor(named: "grayApp")
        self.container.addSubview(self.pointsLabel)
        
        highPointsLabel.text = "100"
        highPointsLabel.font = UIFont(name: "Shrikhand-Regular", size: 20)
        highPointsLabel.textColor = UIColor(named: "grayApp")
        self.container.addSubview(self.highPointsLabel)
        
        
        
        backButton.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
        self.container.addSubview(self.backButton)
        
        quitButton.setBackgroundImage(UIImage(named: "quitButton"), for: .normal)
        self.container.addSubview(self.quitButton)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public override func layoutSubviews() -> Void {
        super.layoutSubviews()
        
        self.frame = (self.superview?.bounds)!
        
        self.container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        self.container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 40).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.scoreLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 30).isActive = true
        self.scoreLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 32).isActive = true
        self.scoreLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.highScoreLabel.centerYAnchor.constraint(equalTo: self.scoreLabel.centerYAnchor).isActive = true
        self.highScoreLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -32).isActive = true
        self.highScoreLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.pointsLabel.centerXAnchor.constraint(equalTo: self.scoreLabel.centerXAnchor).isActive = true
        self.pointsLabel.topAnchor.constraint(equalTo: self.scoreLabel.topAnchor, constant: 32).isActive = true
        self.pointsLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        highPointsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.highPointsLabel.centerXAnchor.constraint(equalTo: self.highScoreLabel.centerXAnchor).isActive = true
        self.highPointsLabel.topAnchor.constraint(equalTo: self.highScoreLabel.topAnchor, constant: 32).isActive = true
        self.highPointsLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        //self.quitButton.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor).isActive = true
        self.backButton.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 147).isActive = true
        
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        self.quitButton.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 8).isActive = true
        self.quitButton.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -40).isActive = true
        self.quitButton.centerXAnchor.constraint(equalTo: self.backButton.centerXAnchor).isActive = true
        self.quitButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.quitButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
}
