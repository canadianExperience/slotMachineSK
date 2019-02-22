import SpriteKit
import GameplayKit

class Spin : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "spinButton", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

