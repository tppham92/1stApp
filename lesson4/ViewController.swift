//
//  ViewController.swift
//  lesson4
//
//  Created by TPPham on 12/24/20.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    @IBOutlet weak var nounTextfield: UITextField!
    @IBOutlet weak var adjTextfield: UITextField!
    @IBOutlet weak var verbTextfield: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var storyPromptImageView: UIImageView!
    let storyPrompt = StoryPromptEntry()
    
    @IBAction func changNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
    }
    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        print(storyPrompt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberSlider.value = 7.5
        storyPrompt.noun = "Toaster"
        storyPrompt.adjective = "Smelly"
        storyPrompt.verb = "Burps"
        storyPrompt.number = Int(numberSlider.value)
        storyPromptImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        storyPromptImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    func updateStoryPrompt()  {
        storyPrompt.noun = nounTextfield.text ?? ""
        storyPrompt.adjective = adjTextfield.text ?? ""
        storyPrompt.verb = verbTextfield.text ?? ""
    }
    
    @objc func changeImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                    }
                }
            }
        }
    }
}



