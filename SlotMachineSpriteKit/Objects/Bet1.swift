import SpriteKit
import GameplayKit

class Bet1 : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "bet1Button", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
