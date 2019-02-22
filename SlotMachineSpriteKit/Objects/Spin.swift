import SpriteKit
import GameplayKit

class Spin : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "spinButton", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        
        self.verticalSpeed = 0.0
        // self.Reset()
    }
    
    override func Reset() {
        self.zPosition = 4
        self.position.y = 3652
        
    }
    
    override func CheckBounds() {
        if(self.position.y <= -2108) {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.verticalSpeed!
        self.CheckBounds()
    }
    
}

