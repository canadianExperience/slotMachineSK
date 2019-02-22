import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

//labels
var creditsLabel: SKLabelNode!
var betLabel: SKLabelNode!
var winningsLabel: SKLabelNode!
var jackPotLabel: SKLabelNode!

class GameScene: SKScene {
  
    var sk1: SK1?
    var sk2: SK2?
    var sk3: SK3?
    
    var bet1: Bet1?
    var bet10: Bet10?
    var bet100: Bet100?
    var betMax: BetMax?
    var spin: Spin?
    var reset: Reset?
    var quit: Quit?
    
    var background: Background?
    var betLine: BetLine?
    
    var playerMoney = 1000
    var winnings = 0
    var jackpot = 5000
    var playerBet = 0
    var winNumber = 0
    var lossNumber = 0
    var spinResult = ["", "", ""]
    var grapes = 0
    var bananas = 0
    var oranges = 0
    var cherries = 0
    var bars = 0
    var bells = 0
    var sevens = 0
    var blanks = 0
    var fruitArray = [String]()
    var component1 = [Int]()
    var component2 = [Int]()
    var component3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    override func didMove(to view: SKView) {
        
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add the background to scene
        background = Background()
        background?.zPosition = 1
        addChild(background!)
        
        // add the betLine to scene
        betLine = BetLine()
        betLine?.zPosition = 3
        betLine?.position = CGPoint(x: 0, y: screenSize.size.height / 2 - 256)
        addChild(betLine!)
        
        //add sk1, sk2, sk3 to scene (fruits)
        
        sk1 = SK1()
        let image1 = UIImage(named: "banana")
        let texture1 = SKTexture(image: image1!)
        sk1?.texture = texture1
        sk1?.zPosition = 2
        sk1?.size = CGSize(width: 100, height: 100)
        sk1?.position = CGPoint(x: -150, y: 25 )
        addChild(sk1!)
        
        sk2 = SK2()
        let image2 = UIImage(named: "banana")
        let texture2 = SKTexture(image: image2!)
        sk2?.texture = texture2
        sk2?.zPosition = 2
        sk2?.size = CGSize(width: 100, height: 100)
        sk2?.position = CGPoint(x: 0, y: 25 )
        addChild(sk2!)
        
        sk3 = SK3()
        let image3 = UIImage(named: "banana")
        let texture3 = SKTexture(image: image3!)
        sk3?.texture = texture3
        sk3?.zPosition = 2
        sk3?.size = CGSize(width: 100, height: 100)
        sk3?.position = CGPoint(x: 150, y: 25 )
        addChild(sk3!)
 
        // add buttons to scene
        
        bet1 = Bet1()
        let bet1Image = UIImage(named: "bet1Button")
        let bet1Texture = SKTexture(image: bet1Image!)
        bet1?.texture = bet1Texture
        bet1?.zPosition = 4
        bet1?.position = CGPoint(x: -screenSize.size.width + 50, y: -screenSize.size.height / 2 - 70)
        addChild(bet1!)
        
        bet10 = Bet10()
        let bet10Image = UIImage(named: "bet10Button")
        let bet10Texture = SKTexture(image: bet10Image!)
        bet10?.texture = bet10Texture
        bet10?.zPosition = 4
        bet10?.position = CGPoint(x: -screenSize.size.width + 180, y: -screenSize.size.height / 2 - 70)
        addChild(bet10!)
        
        bet100 = Bet100()
        let bet100Image = UIImage(named: "bet100Button")
        let bet100Texture = SKTexture(image: bet100Image!)
        bet100?.texture = bet100Texture
        bet100?.zPosition = 4
        bet100?.position = CGPoint(x: -screenSize.size.width + 310, y: -screenSize.size.height / 2 - 70)
        addChild(bet100!)
        
        betMax = BetMax()
        let betMaxImage = UIImage(named: "betMaxButton")
        let betMaxTexture = SKTexture(image: betMaxImage!)
        betMax?.texture = betMaxTexture
        betMax?.zPosition = 4
        betMax?.position = CGPoint(x: -screenSize.size.width + 440, y: -screenSize.size.height / 2 - 70)
        addChild(betMax!)
        
        spin = Spin()
        let spinImage = UIImage(named: "spinButton")
        let spinTexture = SKTexture(image: spinImage!)
        spin?.texture = spinTexture
        spin?.zPosition = 4
        spin?.size = CGSize(width: 140, height: 120)
        spin?.position = CGPoint(x: -screenSize.size.width + 577, y: -screenSize.size.height / 2 - 70)
        addChild(spin!)
        
        reset = Reset()
        let resetImage = UIImage(named: "resetButton")
        let resetTexture = SKTexture(image: resetImage!)
        reset?.texture = resetTexture
        reset?.zPosition = 4
        reset?.size = CGSize(width: 120, height: 140)
        reset?.position = CGPoint(x: screenSize.size.width - 577, y:screenSize.size.height / 2 + 85)
        addChild(reset!)
        
        quit = Quit()
        let quitImage = UIImage(named: "quitButton")
        let quitTexture = SKTexture(image: quitImage!)
        quit?.texture = quitTexture
        quit?.zPosition = 4
        quit?.size = CGSize(width: 120, height: 140)
        quit?.position = CGPoint(x: -screenSize.size.width + 577, y: screenSize.size.height / 2 + 85)
        addChild(quit!)
        
        //set labels
        creditsLabel = (childNode(withName: "credits") as! SKLabelNode)
        creditsLabel?.position = CGPoint(x: -screenSize.size.width + 130, y: -screenSize.size.height / 2 + 50)
        creditsLabel?.zPosition = 2
        creditsLabel?.fontName = "Futura-Bold"
        creditsLabel?.fontColor = UIColor.white
        creditsLabel?.fontSize = 40.00
        
        betLabel = (childNode(withName: "bet") as! SKLabelNode)
        betLabel?.position = CGPoint(x: -screenSize.size.width + 320, y: -screenSize.size.height / 2 + 50)
        betLabel?.zPosition = 3
        betLabel?.fontName = "Futura-Bold"
        betLabel?.fontColor = UIColor.white
        betLabel?.fontSize = 40.00
        
        winningsLabel = (childNode(withName: "winnings") as! SKLabelNode)
        winningsLabel?.position = CGPoint(x: -screenSize.size.width + 510, y: -screenSize.size.height / 2 + 50)
        winningsLabel?.zPosition = 2
        winningsLabel?.fontName = "Futura-Bold"
        winningsLabel?.fontColor = UIColor.white
        winningsLabel?.fontSize = 40.00
        
        jackPotLabel = (childNode(withName: "jackPot") as! SKLabelNode)
        jackPotLabel?.position = CGPoint(x: 0, y: screenSize.size.height / 2 + 50)
        jackPotLabel?.zPosition = 2
        jackPotLabel?.fontName = "Futura-Bold"
        jackPotLabel?.fontColor = UIColor.white
        jackPotLabel?.fontSize = 40.00
        
        fruitArray = ["blank","grapes","banana","orange","cherry","bar","bell","seven"]
        
        for i in 0..<8 {
            component1.append(i)
            component2.append(i)
            component3.append(i)
        }
        showPlayerStats()
    }
    
    // SlotMachine functions
    
    func showPlayerStats()
    {
        betLabel?.text = String(playerBet)
        jackPotLabel?.text = "\(jackpot)"
        creditsLabel?.text = "\(playerMoney)"
        winningsLabel?.text = "\(winNumber)"
    }
    
    func resetFruitTally() {
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        bars = 0
        bells = 0
        sevens = 0
        blanks = 0
    }
    
    func resetAll() {
        playerMoney = 1000
        winnings = 0
        jackpot = 5000
        playerBet = 0
        winNumber = 0
    }
    
    func checkJackPot() {
        
        // compare two random values
        
        let jackPotTry = Int(arc4random_uniform(UInt32(51))) + 1
        
        let jackPotWin = Int(arc4random_uniform(UInt32(51))) + 1
        
        if jackPotTry == jackPotWin {
            playerMoney += jackpot
            jackpot = 1000
            play(soundName: "jackPot")
        }
        else {
            play(soundName: "win")
        }
    }
    
    
    // Utility function to show a win message and increase player money
    func showWinMessage() {
        playerMoney += winnings;
        resetFruitTally();
        checkJackPot();
    }
    
    // Utility function to show a loss message and reduce player money
    func showLossMessage() {
        playerMoney -= playerBet;
        resetFruitTally();
    }
    
    // Utility function to check if a value falls within a range of bounds
    func checkRange(_ value: Int,_ lowerBounds: Int,_ upperBounds: Int) -> Int {
        
        if (value >= lowerBounds && value <= upperBounds)
        {
            return value
        }
        else {
            return -value
        }
    }
    
    //    When this function is called it determines the betLine results.
    //     e.g. Bar - Orange - Banana
    func Reels() -> [String]{
        var betLine = [" ", " ", " "];
        var outCome = [0, 0, 0];
        
        for spin in 0..<3{
            outCome[spin] = Int(arc4random_uniform(UInt32(65))) + 1
            switch (outCome[spin]) {
            //Blank
            case checkRange(outCome[spin], 1, 27):  // 41.5% probability
                betLine[spin] = fruitArray[0]
                blanks += 1
            //Grapes
            case checkRange(outCome[spin], 28, 37): // 15.4% probability
                betLine[spin] = fruitArray[1]
                grapes += 1
            //Banana
            case checkRange(outCome[spin], 38, 46): // 13.8% probability
                betLine[spin] = fruitArray[2]
                bananas += 1
            //Orange
            case checkRange(outCome[spin], 47, 54): // 12.3% probability
                betLine[spin] = fruitArray[3]
                oranges += 1
            //Cherry
            case checkRange(outCome[spin], 55, 59): //  7.7% probability
                betLine[spin] = fruitArray[4]
                cherries += 1
            //Bar
            case checkRange(outCome[spin], 60, 62): //  4.6% probability
                betLine[spin] = fruitArray[5]
                bars += 1
            //Bell
            case checkRange(outCome[spin], 63, 64): //  3.1% probability
                betLine[spin] = fruitArray[6]
                bells += 1
            //Seven
            case checkRange(outCome[spin], 65, 65): //  1.5% probability
                betLine[spin] = fruitArray[7]
                sevens += 1
            default:
                continue
            }
        }
        return betLine
    }
    
    // This function calculates the player's winnings, if any
    func determineWinnings()
    {
        if (blanks == 0)
        {
            if (grapes == 3) {
                winnings = playerBet * 10;
            }
            else if(bananas == 3) {
                winnings = playerBet * 20;
            }
            else if (oranges == 3) {
                winnings = playerBet * 30;
            }
            else if (cherries == 3) {
                winnings = playerBet * 40;
            }
            else if (bars == 3) {
                winnings = playerBet * 50;
            }
            else if (bells == 3) {
                winnings = playerBet * 75;
            }
            else if (sevens == 3) {
                winnings = playerBet * 100;
            }
            else if (grapes == 2) {
                winnings = playerBet * 2;
            }
            else if (bananas == 2) {
                winnings = playerBet * 2;
            }
            else if (oranges == 2) {
                winnings = playerBet * 3;
            }
            else if (cherries == 2) {
                winnings = playerBet * 4;
            }
            else if (bars == 2) {
                winnings = playerBet * 5;
            }
            else if (bells == 2) {
                winnings = playerBet * 10;
            }
            else if (sevens == 2) {
                winnings = playerBet * 20;
            }
            else if (sevens == 1) {
                winnings = playerBet * 5;
            }
            else {
                winnings = playerBet * 1;
            }
            winNumber += 1
            showWinMessage()
        }
        else
        {
            lossNumber += 1
            showLossMessage()
        }
    }
    
    // Set bet1 label
    func bet1_func() {
        play(soundName: "bet")
        playerBet = 1
        betLabel?.text = String(playerBet)
    }
    // Set bet10 label
    
    func bet10_func() {
        play(soundName: "bet")
        playerBet = 10
        betLabel?.text = String(playerBet)
    }
    // Set bet100 label
   
    func bet100_func() {
        play(soundName: "bet")
        playerBet = 100
        //lblBet.text = String(playerBet)
        betLabel?.text = String(playerBet)
    }
    // Set betMax label
    func betMax_func() {
        play(soundName: "bet")
        playerBet = playerMoney
        betLabel?.text = String(playerBet)
    }
    // QUIT button action
    func quitGame_func() {
        play(soundName: "quit")
        
    }
    // RES button action, reset game to initial stage
    func resetGame_func() {
        play(soundName: "res")
        resetAll()
        showPlayerStats()
        spin?.isHidden = false
    }
    
    // SPIN button action
    func spin_func() {
        play(soundName: "spin")
        //playerBet = Int(lblBet.text!)!
        playerBet = Int((betLabel?.text!)!)!
        
        if playerMoney == 0
        {
            spin?.isHidden = true
        }
            
        else if playerBet <= playerMoney {
            spinResult = Reels();
            
            let indexOf0 = fruitArray.firstIndex(of: spinResult[0])!
            let indexOf1 = fruitArray.firstIndex(of: spinResult[1])!
            let indexOf2 = fruitArray.firstIndex(of: spinResult[2])!
            
            let image1Name = fruitArray[indexOf0]
            let image1 = UIImage(named: image1Name)
            let texture1 = SKTexture(image: image1!)
            sk1?.texture = texture1

            let image2Name = fruitArray[indexOf1]
            let image2 = UIImage(named: image2Name)
            let texture2 = SKTexture(image: image2!)
            sk2?.texture = texture2
           
            let image3Name = fruitArray[indexOf2]
            let image3 = UIImage(named: image3Name)
            let texture3 = SKTexture(image: image3!)
            sk3?.texture = texture3

            determineWinnings();
            showPlayerStats();
        }
    }
    
    // This function play sounds
    func play(soundName: String) {
        
        // Play system sound with custom mp3 file
        if let customSoundUrl = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
            var customSoundId: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(customSoundUrl as CFURL, &customSoundId)
            
            if soundName == "quit" {
                AudioServicesAddSystemSoundCompletion(customSoundId, nil, nil, soundFinished, nil)
            }
            AudioServicesPlaySystemSound(customSoundId)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "bet1Button" {
                bet1_func()
            }
            if atPoint(location).name == "bet10Button" {
                bet10_func()
            }
            if atPoint(location).name == "bet100Button" {
                bet100_func()
            }
            if atPoint(location).name == "betMaxButton" {
                betMax_func()
            }
            if atPoint(location).name == "spinButton" {
                spin_func()
            }
            if atPoint(location).name == "resetButton" {
                resetGame_func()
            }
            if atPoint(location).name == "quitButton" {
                quitGame_func()
            }
        }
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
    
//    override func update(_ currentTime: TimeInterval) {
//        background?.Update()
//        betLine?.Update()
//        sk1?.Update()
//        sk2?.Update()
//        sk3?.Update()
//        bet1?.Update()
//        bet10?.Update()
//        bet100?.Update()
//        betMax?.Update()
//        spin?.Update()
//        reset?.Update()
//        quit?.Update()
//    }
}

//Play sound and then exit from app
func soundFinished(_ snd:UInt32, _ c:UnsafeMutableRawPointer?) {
    print("finished!")
    AudioServicesRemoveSystemSoundCompletion(snd)
    AudioServicesDisposeSystemSoundID(snd)
    exit(0)
}
