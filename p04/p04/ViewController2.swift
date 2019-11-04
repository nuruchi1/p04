//
//  ViewController2.swift
//  p04
//
//  Created by Nathaly Uruchima on 10/20/19.
//  Copyright © 2019 Nathaly Uruchima. All rights reserved.
//

import Foundation
import SpriteKit

class ViewController2: SKScene {

    override func didMove(to view: SKView)
    {
        let background = SKSpriteNode(imageNamed: "mainscreenBackground")
            background.position = CGPoint(x: self.size.width/2, y:self.size.height/2)
            background.zPosition = 0
            self.addChild(background)
               
               
        let titleLabel = SKLabelNode(fontNamed: "FinkHeavy")
            titleLabel.text = "How to Play:"
            titleLabel.fontSize = 100
            titleLabel.fontColor = SKColor.black
            titleLabel.zRotation = 0
            titleLabel.position = CGPoint(x: 50, y: 100)
            titleLabel.zPosition = 2
            self.addChild(titleLabel)
    /*
        let infoLabel = SKLabelNode(fontNamed: "FinkHeavy")
            infoLabel.text = "Isabelle has been taking care of the town ever since the Mayor dissapeared."
            infoLabel.fontSize = 40
            infoLabel.fontColor = SKColor.black
            infoLabel.zRotation = 0
            infoLabel.position = CGPoint(x: 0, y: 90)
            infoLabel.zPosition = 1
            self.addChild(infoLabel)
        
         let infoLabel2 = SKLabelNode(fontNamed: "FinkHeavy")
             infoLabel2.text = "Recently the Town has been attacked by familiar faces and the villagers have abandoned the Town out of fear!"
             infoLabel2.fontSize = 40
             infoLabel2.fontColor = SKColor.black
             infoLabel2.zRotation = 0
             infoLabel2.position = CGPoint(x: 0, y: 70)
             infoLabel2.zPosition = 1
             self.addChild(infoLabel2)
        
        let infoLabel3 = SKLabelNode(fontNamed: "FinkHeavy")
            infoLabel3.text = "Help Isabelle defeat the attackers and make the Town safe again!"
            infoLabel3.fontSize = 40
            infoLabel3.fontColor = SKColor.black
            infoLabel3.zRotation = 0
            infoLabel3.position = CGPoint(x: 0, y: 50)
            infoLabel3.zPosition = 1
            self.addChild(infoLabel3)
*/
        
    }
   
}
