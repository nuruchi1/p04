//
//  ViewController3.swift
//  p04
//
//  Created by Nathaly Uruchima on 10/23/19.
//  Copyright © 2019 Nathaly Uruchima. All rights reserved.
//


import SpriteKit
import GameplayKit
var userScore = 0;

class ViewController3: SKScene, SKPhysicsContactDelegate {

    let scoreLabel = SKLabelNode(fontNamed: "FinkHeavy")
    var levelNumb = 0
    var lives = 3
    let livesLabel = SKLabelNode(fontNamed: "FinkHeavy")
    enum gameStatus
    {
        case pre
        case during
        case post
    }
    
    var currentStatus = gameStatus.pre
    
    struct Physics
    {
        static let None: UInt32 = 0
        static let Player: UInt32 = 0b1
        static let Obj : UInt32 = 0b10
        static let Enemy: UInt32 = 0b100
    }
    
    let player = SKSpriteNode(imageNamed: "Isabelle")
    let tapStartLabel = SKLabelNode(fontNamed: "FinkHeavy")
    let runKey = "RemoveKey"
    
    func random (min: CGFloat, max: CGFloat) -> CGFloat
    {
        return CGFloat(arc4random_uniform(UInt32(max-min)) + UInt32(min))
    }
    
    var gameSpace: CGRect
    override init(size: CGSize)
    {
        let maxAspectRatio:CGFloat = 19.5/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameSpace = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
    
    override func didMove(to view: SKView)
    {
        userScore = 0;
        self.physicsWorld.contactDelegate = self
        
        for i in 0...1
        {
            let background = SKSpriteNode(imageNamed: "SkyBackground")
            background.size = self.size
            background.anchorPoint = CGPoint(x:0.5, y:0.5)
            background.position = CGPoint(x: self.size.width/2, y:self.size.height*CGFloat(i)) //background will be under screen and another on screen
            background.zPosition = 0
            background.name = "Background"
            self.addChild(background)
            
        }
        
        player.setScale(0.1)
        player.position = CGPoint(x: player.size.height , y: self.size.width)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.categoryBitMask = Physics.Player
        player.physicsBody!.collisionBitMask = Physics.None
        player.physicsBody!.contactTestBitMask = Physics.Enemy
        self.addChild(player)
        
        let home = SKSpriteNode(imageNamed: "TownHall")
        home.setScale(0.5)
        home.position = CGPoint (x: home.size.height * 0.001, y: self.size.width - 100 )
           home.zPosition = .pi/2
           self.addChild(home)
        
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.white
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.zRotation = .pi/2
        scoreLabel.position = CGPoint(x: self.size.width, y: self.size.height * 0.05)
        scoreLabel.zPosition = 20
        self.addChild(scoreLabel)
        
        livesLabel.text = "Lives: 3"
        livesLabel.fontColor = SKColor.white
        livesLabel.fontSize = 70
        livesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        livesLabel.zRotation = 0
        livesLabel.position = CGPoint(x: self.size.height + livesLabel.frame.size.height, y: self.size.width * 0.25)
        livesLabel.zPosition = 20
        self.addChild(livesLabel)
        
        var lastUpdateTime: TimeInterval = 0
        var deltaFrameTime: TimeInterval = 0
        var movePerSecond: CGFloat = 400.00
        
        func update(currentTime: TimeInterval)
        {
            if lastUpdateTime == 0
            {
                lastUpdateTime = currentTime
            }
            else
            {
                deltaFrameTime = currentTime - lastUpdateTime
                lastUpdateTime = currentTime
            }
            let amountToMoveBackground = movePerSecond * CGFloat(deltaFrameTime)
            self.enumerateChildNodes(withName: "Background")
            {
                background,stop in
                if self.currentStatus == gameStatus.during
                {
                    background.position.y -= amountToMoveBackground
                }
                if background.position.y < -self.size.height
                {
                    background.position.y += self.size.height * 2
                }
            }
        }

        func start()
        {
            currentStatus = gameStatus.during
            let moveObjOnScreen = SKAction.moveTo(y:self.size.height * 0.2, duration: 0.5)
            let startLevel = SKAction.run(startNewLevel)
            let startGameSequence = SKAction.sequence([moveObjOnScreen, startLevel])
            player.run(startGameSequence)
        }
        
        func loseALife()
        {
            lives -= 1
            livesLabel.text = "Lives: \(lives)"
            let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
            let scaleDown = SKAction.scale(to: 1, duration: 0.2)
            let changeColor = SKAction.colorize(with: UIColor.red, colorBlendFactor: 1, duration: 0)
            let returnColor = SKAction.colorize(with: UIColor.white, colorBlendFactor: 1, duration: 0)
            let scaleSequence = SKAction.sequence([changeColor,scaleUp,scaleDown,returnColor])
            livesLabel.run(scaleSequence)
            if lives == 0
            {
               // runGameOver()
            }
        }

        func addScore()
        {
            userScore += 1
            scoreLabel.text = "Score: \(userScore)"
            if userScore == 10 || userScore == 20 || userScore == 50
            {
                startNewLevel()
            }
        }
        
        func startNewLevel()
        {
            levelNumb += 1
            if self.action(forKey: "SpawningEnemies") != nil
            {
                self.removeAction(forKey: "SpawningEnemies")
            }
           
    }

  }
    
}
