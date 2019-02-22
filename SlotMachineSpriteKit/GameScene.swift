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
var bet1: SKLabelNode!
var bet10: SKLabelNode!
var bet100: SKLabelNode!
var betMax: SKLabelNode!
var spin: SKLabelNode!


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
        betLine?.zPosition = 3
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
        
        // bet buttons
        
        bet1 = (childNode(withName: "bet1") as! SKLabelNode)
        bet1?.position = CGPoint(x: -screenSize.size.width + 50, y: -screenSize.size.height / 2 - 80)
        bet1?.text = "BET1"
        bet1?.zPosition = 2
        bet1?.fontName = "Futura-Bold"
        bet1?.fontColor = UIColor.red
        bet1?.fontSize = 48.00
        
        bet10 = (childNode(withName: "bet10") as! SKLabelNode)
        bet10?.position = CGPoint(x: -screenSize.size.width + 200, y: -screenSize.size.height / 2 - 80)
        bet10?.text = "BET10"
        bet10?.zPosition = 2
        bet10?.fontName = "Futura-Bold"
        bet10?.fontColor = UIColor.red
        bet10?.fontSize = 48.00
        
        bet100 = (childNode(withName: "bet100") as! SKLabelNode)
        bet100?.position = CGPoint(x: -screenSize.size.width + 380, y: -screenSize.size.height / 2 - 80)
        bet100?.text = "BET100"
        bet100?.zPosition = 2
        bet100?.fontName = "Futura-Bold"
        bet100?.fontColor = UIColor.red
        bet100?.fontSize = 48.00
        
        spin = (childNode(withName: "spin") as! SKLabelNode)
        spin?.position = CGPoint(x: -screenSize.size.width + 570, y: -screenSize.size.height / 2 - 80)
        spin?.text = "SPIN"
        spin?.zPosition = 2
        spin?.fontName = "Futura-Bold"
        spin?.fontColor = UIColor.green
        spin?.fontSize = 48.00
  
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

