//
//  ViewController.swift
//  TextSpeechDemo
//
//  Created by Alexey Ivanov on 28/1/23.
//

import UIKit
import ARKit
import AVFoundation
//How to convert text to speech
//https://www.hackingwithswift.com/example-code/media/how-to-convert-text-to-speech-using-avspeechsynthesizer-avspeechutterance-and-avspeechsynthesisvoice
class ViewController: UIViewController {
    let synthesizer = AVSpeechSynthesizer()
    var language = "ru-RU"
    
    
    @IBOutlet weak var textField: UITextView!
    
    @IBAction func RussiaButton(_ sender: Any) {
        language = "ru-RU"
    }
    
    @IBAction func spanishButton(_ sender: Any) {
        language = "es-ES"
    }
    
    @IBOutlet weak var pitchSlider: UISlider!
    
    
    @IBOutlet weak var rateSlider: UISlider!
    
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    @IBOutlet weak var Pitch: UILabel!
    
    
    @IBOutlet weak var Rate: UILabel!
    
    
    @IBOutlet weak var Volume: UILabel!
    
    @IBAction func speakButton(_ sender: Any) {
        let utterance = AVSpeechUtterance(string:textField.text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = rateSlider.value
        utterance.pitchMultiplier = pitchSlider.value
        utterance.volume = volumeSlider.value
    
        synthesizer.speak(utterance)
    }
    
    
    @IBAction func PitchValueChanged(_ sender: Any) {
        Pitch.text = String(format:"%.1f", pitchSlider.value)
    }
    
    @IBAction func RateValueChanged(_ sender: Any) {
        Rate.text = String(format:"%.1f", rateSlider.value)
    }
    
    @IBAction func VolumeValueChanged(_ sender: Any) {
        Volume.text = String(format:"%.1f", volumeSlider.value)
    }
    
    
    
    @objc func didTap() {
               self.view.endEditing(true)
            }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
       let gesture = UITapGestureRecognizer(target: self, action:#selector(didTap))
        
        
                view.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }


}

