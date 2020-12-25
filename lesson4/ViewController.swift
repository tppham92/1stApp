//
//  ViewController.swift
//  lesson4
//
//  Created by TPPham on 12/24/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nounTextfield: UITextField!
    @IBOutlet weak var adjTextfield: UITextField!
    @IBOutlet weak var verbTextfield: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    let storyPrompt = StoryPromptEntry()
    
    @IBAction func changNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectSegmentIndex) {
        storyPrompt.genre = genre
    } else {
    storyPrompt.genre = .scifi
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberSlider.value = 7.5
        storyPrompt.noun = "Toaster"
        storyPrompt.adjective = "Smelly"
        storyPrompt.verb = "Burps"
        storyPrompt.number = Int(numberSlider.value)
        print(storyPrompt)
    }
}

