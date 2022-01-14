//
//  GameScene.swift
//  CreamTower
//
//  Created by Luca Hummel on 12/01/22.
//

import SpriteKit

class GameScene: SKScene {
    
    var images: [String] = []
    var placed = [IceCreamBall]()
    var allBalls = [IceCreamBall]()
    var zpos: CGFloat = 1
    let casca: SKSpriteNode = SKSpriteNode(imageNamed: "YellowCasca")
    let nuvens = [SKSpriteNode(imageNamed: "nuvem"), SKSpriteNode(imageNamed: "nuvem"), SKSpriteNode(imageNamed: "nuvem"), SKSpriteNode(imageNamed: "nuvem")]
    let fundo: SKShapeNode = SKShapeNode()
    
    var lifes = 3 {
        didSet {
            lifeLabel.text = String(repeating: "🍦", count: lifes)
        }
    }
    
    var vivo = true
    var velocidade: CGFloat = 3
    var waitTime = 1.5
    
    var scoreLabel = SKLabelNode()
    var lifeLabel = SKLabelNode()
    
    var score = 0 {
        didSet {
            if score % 20 == 0 && waitTime > 0.5{
                waitTime -= 0.5
            } else if score % 10 == 0 && velocidade < 30{
                velocidade += 3
            }
            scoreLabel.text = "\(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        
        
        let background = SKSpriteNode(imageNamed: "backBlue")
        background.position = CGPoint(x: scene!.size.width/2, y: scene!.size.height/2)
        background.blendMode = .replace
        background.zPosition = -5
        addChild(background)
        
        if  FlavorRepository.shared.getAllFlavors().count == 0 {
            _ = FlavorRepository.shared.createFlavor(name: "chocolate", price: 200, imageName: "chocolateBall", isBought: true, isSelected: true)
        }
        
        let allFlavors = FlavorRepository.shared.getAllFlavors()
        for i in allFlavors {
            if let imageName = i.imageName {
                images.append(imageName)
            }
        }
        
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: scene!.size.width/2, y: scene!.size.height-60)
        scoreLabel.fontName = "Shrikhand-Regular"
        scoreLabel.zPosition = 1000
        addChild(scoreLabel)
        
        lifeLabel.text = "🍦🍦🍦"
        lifeLabel.position = CGPoint(x: scene!.size.width/2, y: scene!.size.height-90)
        lifeLabel.fontSize = 20
        lifeLabel.zPosition = 1000
        addChild(lifeLabel)
        
        let fundo = SKShapeNode(rectOf: CGSize(width: scene!.size.width, height: 20))
        fundo.position = CGPoint(x: scene!.size.width/2, y: 0)
        fundo.name = "fundo"
        addChild(fundo)
        
        
        let yRandom = Int.random(in: 0...Int(scene?.size.height ?? -100))
        for i in 0..<nuvens.count {
            nuvens[i].position = CGPoint(x: Int.random(in: 0...Int(scene?.size.width ?? -100)), y: yRandom + i * 200)
            nuvens[i].name = "nuvem"
            nuvens[i].zPosition = -4
            addChild(nuvens[i])
        }
        
        
        casca.position = CGPoint(x: scene!.size.width/2, y: 150)
        casca.name = "casca"
        casca.zPosition = 0
        addChild(casca)
        
        
        recursiveACtionBalls()
    }
    
    // MARK: - Atualizar bolas queda e colisao
    override func update(_ currentTime: TimeInterval) {
        for i in nuvens {
            i.position.x += 0.05
        }
        if vivo == true {
            for iceCreamBall in allBalls {
                let ball = iceCreamBall.iceCreamBallNode
                ball.position.y -= iceCreamBall.velY
                
                if placed.count > 0 {
                    guard let ultimaBola = placed.last?.iceCreamBallNode else { return }
                    if (ball.position.y >= ultimaBola.position.y && ball.position.y <= ultimaBola.position.y + ultimaBola.size.height/2) && (ball.position.x >= ultimaBola.position.x - ultimaBola.size.width/2 && ball.position.x <= ultimaBola.position.x + ultimaBola.size.width/2) {
                        ball.position.x = casca.position.x
                        ball.position.y = ultimaBola.position.y + ball.size.height/2
                        
                        if ball.name == "iceBall" {
                            score += 1
                        } else {
                            lifes -= 1
                            if lifes == 0 {
                                vivo = false
                            }
                        }
                        
                        ball.zPosition = placed[placed.count - 1].iceCreamBallNode.zPosition + 1
                        ball.name = "placedBall"
                        placed.append(iceCreamBall)
                        allBalls.remove(at: allBalls.firstIndex(of: iceCreamBall)!)
                        
                        // Descer sorvete com mais de 15 bolas

                        if (placed[placed.count - 1].iceCreamBallNode.position.y > (scene?.size.height ?? 0)/3) {
                            casca.run(SKAction.moveBy(x: 0, y: -ball.size.height+10, duration: 0.2))
                            for i in nuvens {
                                i.run(SKAction.moveBy(x: 0, y: -ball.size.height, duration: 0.5))
                                if i.position.y < -(i.size.height/2) {
                                    i.position.y = scene?.size.height ?? 1000 + i.size.height/2
                                }
                                if i.position.x > (scene?.size.width)! + i.size.width/2 {
                                    i.position.x = 0 - i.size.width/2
                                }
                            }
                            
                            for iceCreamBallPlaced in placed {
                                let ballPlaced = iceCreamBallPlaced.iceCreamBallNode
                                ballPlaced.run(SKAction.moveBy(x: 0, y: -ball.size.height+10, duration: 0.2))
                                //ball.position.y -= ball.frame.width-10
                                if ballPlaced.position.y < 0 {
                                    placed.remove(at: placed.firstIndex(of: iceCreamBallPlaced)!)
                                    ballPlaced.removeFromParent()
                                }
                            }
                            if casca.position.y + casca.size.height/2 < 0 {
                                casca.removeFromParent()
                            }
                        }
                        
                        continue
                    }
                } else {
                    if (ball.position.y >= casca.position.y + casca.size.height/2 && ball.position.y <= casca.position.y + casca.size.height/2 + 5) && ball.position.x >= casca.position.x - casca.size.width/2 && ball.position.x <= casca.position.x + casca.size.width/2{
                        ball.position.x = casca.position.x
                        if ball.name == "iceBall" {
                            score += 1
                        } else {
                            lifes -= 1
                            if lifes == 0 {
                                vivo = false
                            }
                        }
                        
                        ball.zPosition = zpos
                        ball.name = "placedBall"
                        placed.append(iceCreamBall)
                        allBalls.remove(at: allBalls.firstIndex(of: iceCreamBall)!)
                        continue
                    }
                    
                }
                
                
                if (ball.position.y >= fundo.position.y - 10 && ball.position.y <= fundo.position.y + 10) {
                    if ball.name == "iceBall" {
                        lifes -= 1
                        if lifes == 0 {
                            vivo = false
                        }
                    }
                    ball.removeFromParent()
                    allBalls.remove(at: allBalls.firstIndex(of: iceCreamBall)!)
                }
            }
        }
        
        
    }
    
    // MARK: - Movimento
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if location.x - 25 > 0 && location.x + 25 < frame.width {
            casca.position = CGPoint(x: location.x, y: casca.position.y)
            
            for iceCreamBall in placed {
                let ball = iceCreamBall.iceCreamBallNode
                ball.position.x = casca.position.x
            }
        }
        
        
    }
    
    // MARK: - Create Ice Cream Ball
    func createIceBall() {
        if vivo {
            images.shuffle()
            let iceBall = IceCreamBall(image: images[0], velY: velocidade)
            if iceBall.image == "badBall" {
                iceBall.iceCreamBallNode.name = "badBall"
            } else {
                iceBall.iceCreamBallNode.name = "iceBall"
            }
            
            if let largura = scene?.size.width, let altura = scene?.size.height {
                iceBall.iceCreamBallNode.position = CGPoint(x: Int.random(in: Int(iceBall.iceCreamBallNode.size.width/2)...Int(largura)-Int(iceBall.iceCreamBallNode.size.width)), y: Int(altura) + 50)
            }
            iceBall.iceCreamBallNode.zPosition = zpos + 10
            zpos += 1
            
            addChild(iceBall.iceCreamBallNode)
            allBalls.append(iceBall)
        } else {
            cancelActionDropBall()
        }
    }
    
    
    // MARK: - Recursiva create
    func recursiveACtionBalls(){
        let recursive = SKAction.sequence([
            SKAction.run(createIceBall),
            SKAction.wait(forDuration: waitTime),
            SKAction.run({[unowned self] in self.recursiveACtionBalls()})
        ])
        
        run(recursive, withKey: "aKey")
    }
    
    func cancelActionDropBall() {
        removeAction(forKey: "aKey")
    }
}


