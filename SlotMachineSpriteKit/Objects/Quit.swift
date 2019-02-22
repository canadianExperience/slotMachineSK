import SpriteKit
import GameplayKit

class Quit : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "quitButton", initialScale: 2.0)
       // Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


