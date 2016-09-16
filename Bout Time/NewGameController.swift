//
//  NewGameController.swift
//  Bout Time
//
//  Created by Michael De La Cruz on 9/13/16.
//  Copyright © 2016 Michael De La Cruz. All rights reserved.
//

import UIKit

class NewGameController: UIViewController {
    
    // Need to make a UILabel considering it to be var gameScoreLabel
    @IBOutlet weak var scoreBoardLabel: UILabel!
    
    var newGameScore: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additonal setup after loading the view.
        scoreBoardLabel.text = newGameScore
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any response that can be recreated
    }
}
