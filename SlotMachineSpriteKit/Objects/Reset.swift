import SpriteKit
import GameplayKit

class Reset : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "resetButton", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


