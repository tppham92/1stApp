//
//  ViewController.swift
//  lesson4
//
//  Created by TPPham on 12/24/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyPrompt = StoryPromptEntry()
        storyPrompt.noun = "Toaster"
        storyPrompt.adjective = "Smelly"
        storyPrompt.verb = "Burps"
        storyPrompt.number = 10
        print(storyPrompt)
    }
}

