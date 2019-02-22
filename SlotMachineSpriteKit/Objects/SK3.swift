
import SpriteKit
import GameplayKit

class Cherry : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "cherry", initialScale: 1.0)
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
        self.zPosition = 2
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

