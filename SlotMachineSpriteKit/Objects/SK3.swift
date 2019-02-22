import SpriteKit
import GameplayKit

class SK3 : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "banana", initialScale: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
