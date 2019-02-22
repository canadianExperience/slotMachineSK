import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

//labels
var credits: SKLabelNode!
var bet: SKLabelNode!
var winnings: SKLabelNode!
var jackPot: SKLabelNode!


class GameScene: SKScene {
    
    
   
    var background: Background?
    var betLine: BetLine?
    
   
    var degToRad = 0.01745329252
    
    
    override func didMove(to view: SKView) {
        
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add the betLine to scene
        background = Background()
        background?.zPosition = 1
        addChild(background!)
        
        betLine = BetLine()
        betLine?.zPosition = 2
        addChild(betLine!)
        
        credits = (childNode(withName: "credits") as! SKLabelNode)
        credits?.position = CGPoint(x: -screenSize.size.width + 130, y: -screenSize.size.height / 2 + 55)
        credits?.text = "cred"
        credits?.zPosition = 2
        credits?.fontName = "Futura-Bold"
        credits?.fontColor = UIColor.white
        credits?.fontSize = 40.00
        
        bet = (childNode(withName: "bet") as! SKLabelNode)
        bet?.position = CGPoint(x: -screenSize.size.width + 320, y: -screenSize.size.height / 2 + 55)
        bet?.text = "bet"
        bet?.zPosition = 2
        bet?.fontName = "Futura-Bold"
        bet?.fontColor = UIColor.white
        bet?.fontSize = 40.00
        
        winnings = (childNode(withName: "winnings") as! SKLabelNode)
        winnings?.position = CGPoint(x: -screenSize.size.width + 510, y: -screenSize.size.height / 2 + 55)
        winnings?.text = "win"
        winnings?.zPosition = 2
        winnings?.fontName = "Futura-Bold"
        winnings?.fontColor = UIColor.white
        winnings?.fontSize = 40.00
        
        jackPot = (childNode(withName: "jackPot") as! SKLabelNode)
        jackPot?.position = CGPoint(x: 0, y: screenSize.size.height / 2 + 50)
        jackPot?.text = "jackPot"
        jackPot?.zPosition = 2
        jackPot?.fontName = "Futura-Bold"
        jackPot?.fontColor = UIColor.white
        jackPot?.fontSize = 40.00
        
        // betLine position
        
        betLine?.position = CGPoint(x: 0, y: screenSize.size.height / 2 - 256)
  
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        //plane?.position = CGPoint(x: pos.x, y: -500.0)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       // plane?.position = CGPoint(x: pos.x, y: -500.0)
    }
    
    func touchUp(atPoint pos : CGPoint) {
      //  plane?.position = CGPoint(x: pos.x, y: -500.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        background?.Update()
        betLine?.Update()
      
        
    }
    
}

