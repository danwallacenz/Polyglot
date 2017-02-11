//
//  TestViewController.swift
//  Polyglot
//
//  Created by Daniel Wallace on 11/02/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit
import GameKit

class TestViewController: UIViewController {

    var words: [String]!
    var questionCounter = 0
    var showingQuestion = true
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var prompt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(nextTapped))
        words = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: words) as! [String]
        title = "TEST"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // the view was just shown - start asking a question now
        askQuestion()
    }
    
    func nextTapped() {
        // move between showing question and answer
        showingQuestion = !showingQuestion
        
        if showingQuestion {
            // we should be showing the question – reset!
            prepareForNextQuestion()
        } else {
            // we should be showing the answer – show it now, and set the color to be green
            prompt.text = words[questionCounter].components(separatedBy: "::")[0]
            prompt.textColor = UIColor(red: 0, green: 0.7, blue: 0, alpha: 1)
        }
    }

    func askQuestion() {
        // move the question counter one place
        questionCounter += 1
        if questionCounter == words.count {
            // wrap it back to 0 if we've gone beyond the size of the array
            questionCounter = 0
        }
        
        // pull out the French word at the current question position
        prompt.text = words[questionCounter].components(separatedBy: "::")[1]
    }
    
    func prepareForNextQuestion() {
        // reset the prompt back to black
        prompt.textColor = UIColor.black
        
        // proceed with the next question
        askQuestion()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
