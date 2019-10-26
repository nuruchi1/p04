//
//  GameScene.swift
//  p04
//
//  Created by Nathaly Uruchima on 10/14/19.
//  Copyright © 2019 Nathaly Uruchima. All rights reserved.
//

import Foundation
import SpriteKit


class GameScene: SKScene {
    
    override func didMove(to view:SKView)
    {
        let background = SKSpriteNode(imageNamed: "mainscreenBackground")
        background.position = CGPoint(x: self.size.width/5, y:self.size.height/5)
        background.zPosition = 0
        self.addChild(background)
        
        
        let titleLabel = SKLabelNode(fontNamed: "FinkHeavy")
        titleLabel.text = "Animal Crossing:"
        titleLabel.fontSize = 50
        titleLabel.fontColor = SKColor.black
        titleLabel.zRotation = 0
        titleLabel.position = CGPoint(x: 0, y: 100)
        titleLabel.zPosition = 0
        self.addChild(titleLabel)
        
        let titleLabel2 = SKLabelNode(fontNamed: "FinkHeavy")
        titleLabel2.text = "Isabelle's Duty"
        titleLabel2.fontSize = 40
        titleLabel2.fontColor = SKColor.black
        titleLabel2.zRotation = 0
        titleLabel2.position = CGPoint(x: 0, y: 50)
        titleLabel2.zPosition = 0
        self.addChild(titleLabel2)
        
        let startGameLabel = SKLabelNode(fontNamed: "FinkHeavy")
        startGameLabel.text = "Start"
        startGameLabel.fontSize = 30
        startGameLabel.fontColor = SKColor.black
        startGameLabel.zRotation = 0
        startGameLabel.position = CGPoint(x: 0, y: -20)
        startGameLabel.zPosition = 0
        startGameLabel.name = "startButton"
        self.addChild(startGameLabel)
        
        let h2pGameLabel = SKLabelNode(fontNamed: "FinkHeavy")
        h2pGameLabel.text = "How to Play"
        h2pGameLabel.fontSize = 30
        h2pGameLabel.fontColor = SKColor.black
        h2pGameLabel.zRotation = 0
        h2pGameLabel.position = CGPoint(x: 0, y: -60)
        h2pGameLabel.zPosition = 0
        h2pGameLabel.name = "h2pButton"
        self.addChild(h2pGameLabel)
        
        let exitGameLabel = SKLabelNode(fontNamed: "FinkHeavy")
        exitGameLabel.text = "Exit"
        exitGameLabel.fontSize = 30
        exitGameLabel.fontColor = SKColor.black
        exitGameLabel.zRotation = 0
        exitGameLabel.position = CGPoint(x: 0, y: -100)
        exitGameLabel.zPosition = 0
        exitGameLabel.name = "exitButton"
        self.addChild(exitGameLabel)
        

    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeTapped = atPoint(pointOfTouch)
            if nodeTapped.name == "startButton"{
                let sceneToMoveTo = ViewController3(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
             
        }
    }

}
