import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    
   
    var background: Background?
    
   
    var degToRad = 0.01745329252
    
    
    override func didMove(to view: SKView) {
        
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add the ocean to scene
        background = Background()
        background?.zPosition = 1
        addChild(background!)
  
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
      
        
    }
    
}

