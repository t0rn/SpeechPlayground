//
//  ViewController.swift
//  TextSpeechDemo
//
//  Created by Alexey Ivanov on 28/1/23.
//

import UIKit
import AVKit
//How to convert text to speech

class ViewController: UIViewController {
    var language :String = "ru-RU"
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var input: UITextView!
    
    
    @IBOutlet weak var rateSlader: UISlider!
    
    @IBOutlet weak var pitchSlider: UISlider!
    
   
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func speak(_ sender: Any) {
        var str :String = input.text ?? ""
        let utterance = AVSpeechUtterance(string: str)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = rateSlader.value
        utterance.pitchMultiplier = pitchSlider.value
        utterance.postUtteranceDelay = 0.2
        utterance.volume = volumeSlider.value
        synthesizer.speak(utterance)
        
    }

    @IBAction func rus(_ sender: Any) {
        language = "ru-RU"
    }
    
    @IBAction func spanish(_ sender: Any) {
        language = "es-ES'"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

