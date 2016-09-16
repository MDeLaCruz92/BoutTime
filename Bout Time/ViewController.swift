//
//  ViewController.swift
//  Bout Time
//
//  Created by Michael De La Cruz on 9/13/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import UIKit
import AVFoundation
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var game1Label: UILabel!
    @IBOutlet weak var game2Label: UILabel!
    @IBOutlet weak var game3Label: UILabel!
    @IBOutlet weak var game4Label: UILabel!
    
    @IBOutlet weak var game1DownButton: UIButton!
    @IBOutlet weak var game2UpButton: UIButton!
    @IBOutlet weak var game2DownButton: UIButton!
    @IBOutlet weak var game3UpButton: UIButton!
    @IBOutlet weak var game3DownButton: UIButton!
    @IBOutlet weak var game4UpButton: UIButton!
    
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var RoundLabel: UILabel!

    
    @IBAction func game1DownSwap(sender: AnyObject) {
        swap(&currentRound[0], &currentRound[1])
        updateGameLabels()
    }
    
    @IBAction func game2UpSwap(sender: AnyObject) {
        swap(&currentRound[1], &currentRound[0])
        updateGameLabels()
    }
    
    @IBAction func game2DownSwap(sender: AnyObject) {
        swap(&currentRound[1], &currentRound[2])
        updateGameLabels()
    }
    
    @IBAction func game3UpSwap(sender: AnyObject) {
        swap(&currentRound[2], &currentRound[1])
        updateGameLabels()
    }
    
    @IBAction func game3DownSwap(sender: AnyObject) {
        swap(&currentRound[2], &currentRound[3])
        updateGameLabels()
    }
    
    @IBAction func game4UpSwap(sender: AnyObject) {
        swap(&currentRound[3], &currentRound[2])
        updateGameLabels()
    }
    
    
  
    
    @IBAction func nextRoundButtonTouched(sender: AnyObject) {
        
        nextRoundButton.hidden = true
        shakeLabel.hidden = false
        clearCurrentRound()
        startRound()
    }
    
    // Stored Properties
    
    var soundEffect: AVAudioPlayer!
    var gameScore = 0
    var roundCounter = 1
    var countDown = 60
    var timer: NSTimer?
    var gameEvents: [HistoricalManager] = []
    var currentRound: [HistoricalManager] = []
    var nextGame: [HistoricalManager] = []
    
    
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func viewDidAppear(animated: Bool) {
        showAlert("Put the video game events in which they were first released! The oldest to the top and the most recent to the bottom!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            checkAnswer(currentRound)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "gameOver" {
            let svg = segue.destinationViewController as! NewGameController
            
            svg.newGameScore = "\(gameScore)/6"
        }
    }
    
    // MARK: Randomize Questions method
    // Takes the 40 questions from the videoGameList array that is located in the HistoricalManager.swift file
    func startGame() {
        
        shuffle()
        for i in 0...39 {
            gameEvents.append(nextGame[i])
        }
        startRound()
    }
    
    // MARK: startRound Method
    // Starts a new round by selecting the first four questions from gameEvents
    func startRound() {
    RoundLabel.text = "Round: \(roundCounter)"
    if roundCounter == 7 {
        endGame()
        return
    }
    
    // MARK: Timer Method
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.startTimer), userInfo: nil, repeats: true)
        
        for i in 0...3 {
            currentRound.append(gameEvents[i])
            // sets the UITextView to each event
        }
        
        game1Label.text = currentRound[0].description
        game2Label.text = currentRound[1].description
        game3Label.text = currentRound[2].description
        game4Label.text = currentRound[3].description
        
    }
    // resets the timer to 60 after each rounds
    func resetCounterLabel() {
        countDown = 60
        countDownLabel.text = "0:\(countDown)"
    }
    
    // Sets the timer
    func startTimer() {
        countDown -= 1
        countDownLabel.text = "0:\(countDown)"
        
        if countDown < 10 {
            countDownLabel.text = "0:0\(countDown)"
        }
        
        if countDown == 0 {
            timer!.invalidate()
            checkAnswer(currentRound)
        }
    }
    
    // Takes the users answer then shorts it. If the user answer matches the sorted answer, the user is awarded one point for each round.
    func checkAnswer(Useranswer: [HistoricalManager]) {
        
        timer!.invalidate()
        resetCounterLabel()
        roundCounter += 1
        // sorts the users answer. We are putting all the events in order
        let answer = Useranswer.sort {$0.date < $1.date}
        
        if currentRound == answer {
            // Adds 2 point for given round
            gameScore += 1
            nextRoundButton.setImage(UIImage(named: "next_round_success.png"), forState: UIControlState.Normal)
            playSound("Confirm.wav")
        } else {
            playSound("Bobble.wav")
            nextRoundButton.setImage(UIImage(named: "next_round_fail.png"), forState: UIControlState.Normal)
        }
        
        countDown = 60
        endRound()
        showNextRoundButton()
        
    }
    
    // Updates the label text
    func updateGameLabels() {
        
        game1Label.text = currentRound[0].description
        game2Label.text = currentRound[1].description
        game3Label.text = currentRound[2].description
        game4Label.text = currentRound[3].description
    }

    // Shuffles the array so that each game is distinctive
    func shuffle() {
        nextGame = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(VideoGameList) as! [HistoricalManager]
    }
    
    // Removes the last 4 items from the current array so that it will not repeat the same events
    func endRound() {
        
        gameEvents.removeRange(0...3)
    }
    
    // Displays nextRoundButton
    func showNextRoundButton() {
        
        nextRoundButton.hidden = false
        shakeLabel.hidden = true
    }
    
    // Clears the current round array after which you will need to call startRound() to add events for the following round
    func clearCurrentRound() {
        
        currentRound.removeAll()
    }
    
    // Calls check answer when user shakes the device
    func userShakesiPhone() {
        
        checkAnswer(currentRound)
    }
    
    // Play sound effects for correct or wrong answers by taking a string as a parameter we can pass in the sound that we need
    func playSound(file: String) {
        
        let path = NSBundle.mainBundle().pathForResource(file, ofType: nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            soundEffect = sound
            sound.play()
        } catch {
            print("File not found")
        }
    }
    
    // Game over! display user score
    func endGame() {
        
        roundCounter = 0
        RoundLabel.text = "Round: \(roundCounter)"
        self.performSegueWithIdentifier("gameOver", sender: self)
    }
    
    // Diplays an Alert message at the beginning of the game to notify the user how to play the game
    func showAlert(title: String, message: String? = nil, style: UIAlertControllerStyle = .Alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: dismissAlert)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // Dimisses the alert
    func dismissAlert(sender: UIAlertAction) {
        startGame()
    }
    
    

}

