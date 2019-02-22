import SpriteKit
import GameplayKit

class Bet100 : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "bet100Button", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

